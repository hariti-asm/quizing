port module Evaluate exposing (Model, Msg, init, update, view)

import Browser
import Html exposing (Html, a, button, div, input, label, span, text)
import Html.Attributes exposing (checked, class, classList, disabled, href, id, list, name, placeholder, type_, value)
import Html.Events exposing (onClick, onInput)
import Json.Decode as Decode exposing (Decoder, Value)
import Json.Encode as Encode exposing (encode, int, object, string)
import Msg exposing (Msg(..))
import MyList exposing (append)


type Msg
    = NextQuestion
    | PreviousQuestion
    | SelectOption Int String
    | AddNewQuestion
    | MarkChange String
    | OptionChange String String
    | TextChange String
    | CorrectAnserChange String
    | StorageNewQ


type alias Question =
    { text : String
    , options : List ( String, String )
    , correctAnswer : String
    , mark : Int
    , answers : List String
    }


type alias Model =
    { questions : List Question
    , currentIndex : Int
    , score : Int
    , newQuestion : Maybe Question
    }


port saveModel2 : Encode.Value -> Cmd msg


port storeModel2 : Encode.Value -> Cmd msg


emptyQuestion : Question
emptyQuestion =
    { text = ""
    , options = [ ( "A", "" ), ( "B", "" ), ( "C", "" ) ]
    , correctAnswer = ""
    , mark = 0
    , answers = []
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddNewQuestion ->
            let
                newModel =
                    { model | newQuestion = Just emptyQuestion }

                encodedNewModel =
                    encodeModel newModel
            in
            ( newModel
            , storeModel2 encodedNewModel
            )

        StorageNewQ ->
            case model.newQuestion of
                Nothing ->
                    ( model, Cmd.none )

                Just newQuestion ->
                    let
                        newModel =
                            { model
                                | newQuestion =
                                    Just emptyQuestion
                                , questions = newQuestion :: model.questions
                            }

                        encodedNewModel =
                            encodeModel newModel

                        storingagain =
                            storeModel2 encodedNewModel
                    in
                    ( newModel, storingagain )

        NextQuestion ->
            let
                nextIndex =
                    if model.currentIndex < (List.length model.questions - 1) then
                        model.currentIndex + 1

                    else
                        model.currentIndex
            in
            ( { model | currentIndex = nextIndex }, Cmd.none )

        PreviousQuestion ->
            let
                prevIndex =
                    if model.currentIndex > 0 then
                        model.currentIndex - 1

                    else
                        model.currentIndex
            in
            ( { model | currentIndex = prevIndex }, Cmd.none )

        SelectOption index_ selectedOption ->
            let
                question =
                    List.indexedMap
                        (\index q ->
                            if index == index_ then
                                { q
                                    | answers =
                                        if List.member selectedOption q.answers then
                                            let
                                                khassoYb9a =
                                                    \label -> selectedOption /= label
                                            in
                                            List.filter khassoYb9a q.answers

                                        else
                                            selectedOption :: q.answers
                                }

                            else
                                q
                        )
                        model.questions

                isLastQuestion =
                    model.currentIndex == (List.length model.questions - 1)

                allQuestionsAnswered =
                    List.all
                        (\q -> List.length q.answers > 0)
                        model.questions
            in
            if isLastQuestion && allQuestionsAnswered then
                let
                    score =
                        List.foldl
                            (\q acc ->
                                if List.sort q.answers == List.sort [ q.correctAnswer ] then
                                    acc + q.mark

                                else
                                    acc
                            )
                            0
                            model.questions
                in
                ( { model | score = score }, Cmd.none )

            else
                ( { model | questions = question }, Cmd.none )

        OptionChange optionLabel newtext ->
            case model.newQuestion of
                Nothing ->
                    ( model, Cmd.none )

                Just newQuestion ->
                    let
                        updatedNewquestion =
                            { newQuestion
                                | options =
                                    List.map
                                        (\( label_, text ) ->
                                            if label_ == optionLabel then
                                                ( label_, newtext )

                                            else
                                                ( label_, text )
                                        )
                                        newQuestion.options
                            }
                    in
                    ( { model | newQuestion = Just updatedNewquestion }, Cmd.none )

        CorrectAnserChange newanswer ->
            case model.newQuestion of
                Nothing ->
                    ( model, Cmd.none )

                Just newQuestion ->
                    let
                        updatedNewquestion =
                            { newQuestion | correctAnswer = newanswer }
                    in
                    ( { model | newQuestion = Just updatedNewquestion }, Cmd.none )

        TextChange newtext ->
            case model.newQuestion of
                Nothing ->
                    ( model, Cmd.none )

                Just newQuestion ->
                    let
                        updatedNewquestion =
                            { newQuestion | text = newtext }
                    in
                    ( { model | newQuestion = Just updatedNewquestion }, Cmd.none )

        MarkChange newmark ->
            case model.newQuestion of
                Nothing ->
                    ( model, Cmd.none )

                Just newQuestion ->
                    let
                        updatedNewquestion =
                            { newQuestion | mark = String.toInt newmark |> Maybe.withDefault 0 }
                    in
                    ( { model | newQuestion = Just updatedNewquestion }, Cmd.none )


init : Value -> ( Model, Cmd Msg )
init flags =
    let
        initialModel =
            (Debug.log " Decoded flags" <|
                Decode.decodeValue
                    decodeModel
                    flags
            )
                |> Result.withDefault
                    { questions = []
                    , currentIndex = 0
                    , score = 0
                    , newQuestion = Nothing
                    }
    in
    ( initialModel, saveModel2 (encodeModel initialModel) )


questionDecoder : Decoder Question
questionDecoder =
    Decode.map5
        Question
        (Decode.field "text" Decode.string)
        (Decode.field "options" (Decode.list optionDecoder))
        (Decode.field "correctAnswer" Decode.string)
        (Decode.field "mark" Decode.int)
        (Decode.field "answers" (Decode.list Decode.string))


questionEncoder : Question -> Encode.Value
questionEncoder question =
    Encode.object
        [ ( "text", Encode.string question.text )
        , ( "options", Encode.list optionEncoder question.options )
        , ( "correctAnswer", Encode.string question.correctAnswer )
        , ( "mark", Encode.int question.mark )
        , ( "answers"
          , Encode.list Encode.string question.answers
          )
        ]


optionDecoder : Decoder ( String, String )
optionDecoder =
    Decode.map2
        Tuple.pair
        (Decode.field "label" Decode.string)
        (Decode.field "value" Decode.string)


optionEncoder : ( String, String ) -> Encode.Value
optionEncoder ( label, value ) =
    Encode.object
        [ ( "label", Encode.string label )
        , ( "value", Encode.string value )
        ]


encodeModel : Model -> Encode.Value
encodeModel model =
    Encode.object
        [ ( "questions", Encode.list questionEncoder model.questions )
        , ( "currentIndex", Encode.int model.currentIndex )
        , ( "score", Encode.int model.score )
        , ( "newQuestion"
          , case model.newQuestion of
                Just q ->
                    questionEncoder q

                Nothing ->
                    Encode.null
          )
        ]


decodeModel : Decode.Decoder Model
decodeModel =
    Decode.map4 Model
        (Decode.field "questions" (Decode.list questionDecoder))
        (Decode.field "currentIndex" Decode.int)
        (Decode.field "score" Decode.int)
        (Decode.field "newQuestion" (Decode.nullable questionDecoder))


view : Model -> Html Msg
view model =
    div [ class "flex flex-col items-center" ]
        [ -- , div [] [ text (String.fromInt model.score) ]
          div [] (List.indexedMap (\index question -> questionView index question) model.questions)
        , button [ onClick PreviousQuestion ] [ text "Previous" ]
        , button [ onClick NextQuestion ] [ text "Next" ]
        ]


questionView : Int -> Question -> Html Msg
questionView index question =
    div [ id (String.fromInt index) ]
        [ div [ class " text-xl mb-10 text-2xl" ] [ text (String.fromInt (index + 1) ++ ") " ++ question.text) ]
        , div [ class " flex flex-col  gap-6 text-xl" ]
            (List.map
                (\( optionLabel, optionValue ) ->
                    viewOption
                        { optionValue = optionValue
                        , optionLabel = optionLabel
                        , isChecked =
                            List.member optionLabel question.answers
                        , onSelect = SelectOption index
                        }
                )
                question.options
            )
        ]


viewOption : { a | optionLabel : String, optionValue : String, isChecked : Bool, onSelect : String -> Msg } -> Html Msg
viewOption { optionLabel, optionValue, isChecked, onSelect } =
    div []
        [ label
            [ classList
                [ ( "bg-[#8419FF] text-white ", isChecked )
                , ( "border border-solid  border-1.5 solid border-[#F0EBF5]  rounded-xl gap-6 px-10 w-full py-4 focus:bg-[#8419FF]"
                  , True
                  )
                ]
            , onClick
                (onSelect optionLabel)
            ]
            [ span [ class "text-[#F0EBF5]" ] [ text optionLabel ], text (" " ++ optionValue) ]
        ]
