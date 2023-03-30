port module Main exposing (main)

import Browser
import Html exposing (Html, button, div, input, label, span, text)
import Html.Attributes exposing (checked, class, classList, disabled, for, id, name, type_, value)
import Html.Events exposing (onClick, onInput)
import Json.Decode as Decode exposing (Decoder, Value)
import Json.Encode as Encode
import Msg exposing (Msg(..))


type Msg
    = NextQuestion
    | PreviousQuestion
    | SelectOption Int String
    | AddQuestion
    | AddQuiz


type alias Question =
    { text : String
    , options : List ( String, String )
    , correctAnswer : String
    , mark : Int
    , answers : List String
    }



-- add more questions


type alias Model =
    { title : String
    , questions : List Question
    , currentIndex : Int
    , score : Int
    }


port saveModel : Encode.Value -> Cmd msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
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

        AddQuestion ->
            let
                newQuestion =
                    { text = ""
                    , options = [ ( "", "" ), ( "", "" ), ( "", "" ) ]
                    , correctAnswer = ""
                    , mark = 0
                    , answers = []
                    }
            in
            ( { model | questions = model.questions ++ [ newQuestion ] }, Cmd.none )

        AddQuiz ->
            let
                newQuiz =
                    { title = ""
                    , questions = []
                    , currentIndex = 0
                    , score = 0
                    }
            in
            ( { model | questions = model.questions ++ [], title = "", currentIndex = 0, score = 0 }, Cmd.none )


main : Program Value Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : Value -> ( Model, Cmd Msg )
init flags =
    let
        initialModel =
            Decode.decodeValue decodeModel flags
                |> Result.withDefault { title = "", questions = [], currentIndex = 0, score = 0 }
    in
    ( initialModel, saveModel (encodeModel initialModel) )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


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
        ]


optionDecoder : Decoder ( String, String )
optionDecoder =
    Decode.map2
        Tuple.pair
        (Decode.field "label" Decode.string)
        (Decode.field " value " Decode.string)


optionEncoder : ( String, String ) -> Encode.Value
optionEncoder ( label, value ) =
    Encode.object
        [ ( "label", Encode.string label )
        , ( "value", Encode.string value )
        ]


encodeModel : Model -> Encode.Value
encodeModel model =
    Encode.object
        [ ( "title", Encode.string model.title )
        , ( "questions", Encode.list questionEncoder model.questions )
        , ( "currentIndex", Encode.int model.currentIndex )
        , ( "score", Encode.int model.score )
        ]


decodeModel : Decode.Decoder Model
decodeModel =
    Decode.map4 Model
        (Decode.field "title" Decode.string)
        (Decode.field "questions" (Decode.list questionDecoder))
        (Decode.field "currentIndex" Decode.int)
        (Decode.field "score" Decode.int)


view : Model -> Html Msg
view model =
    let
        maybeQuestion =
            List.head (List.drop model.currentIndex model.questions)
    in
    case maybeQuestion of
        Just question ->
            let
                isAnswerSelected =
                    List.length question.answers > 0

                isLastQuestion =
                    model.currentIndex == (List.length model.questions - 1)
            in
            div []
                [ div []
                    [ label [ for "title-input" ] [ text "Title" ]
                    , input
                        [ type_ "text", value model.title ]
                        []
                    ]
                , div
                    [ class "flex  flex-col items-center mt-[200px] font-Rubik" ]
                    [ div [ class "font-bold text-4xl" ] [ text "Quiz" ]
                    , questionView model.currentIndex question
                    , div
                        [ class "flex space-x-28" ]
                        [ button [ onClick PreviousQuestion, class "w-48 h-16 mt-10 focus:bg-[#FFC700]" ] [ text "Previous" ]
                        , button
                            [ onClick NextQuestion
                            , disabled (not isAnswerSelected)
                            , class "bg-[#FFC700] w-48 h-16 mt-10"
                            ]
                            [ text "Next" ]
                        ]
                    , if isLastQuestion then
                        div [ class "mt-10 text-2xl font-semibold italic" ]
                            [ text ("Your score is: " ++ String.fromInt model.score) ]

                      else
                        text ""
                    ]
                ]

        Nothing ->
            div [ class "flex flex-col items-center mt-96 gap-12" ]
                [ div [ class "text-3xl italic" ]
                    [ text "No questions found." ]
                , button
                    [ class "italic font-semibold text-xl w-48 h-16 bg-[#8419FF] focus:bg-[#FFC700] rounded-md", onClick AddQuiz ]
                    [ text "Add quiz" ]
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


viewOption : { optionLabel : String, optionValue : String, isChecked : Bool, onSelect : String -> msg } -> Html msg
viewOption { optionLabel, optionValue, isChecked, onSelect } =
    label
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
