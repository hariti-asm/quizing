port module Add exposing (..)

import Browser
import Evaluate exposing (..)
import Html exposing (Html, a, button, div, input, label, span, text)
import Html.Attributes exposing (checked, class, classList, disabled, href, id, name, placeholder, type_, value)
import Html.Events exposing (onClick, onInput)
import Json.Decode as Decode exposing (Decoder, Value)
import Json.Encode as Encode exposing (encode)
import Msg exposing (Msg(..))


type Msg
    = AddNewQuestion
    | MarkChange String
    | OptionChange String String
    | TextChange String
    | StorageNewQ
    | SelectOption Int String
    | CorrectAnserChange String
    | ResetInput
    | SubjectChange String


type alias Question =
    { text : String
    , options : List ( String, String )
    , correctAnswer : String
    , mark : Int
    , answers : List String
    , subject : Subject
    }


type alias Subject =
    { id : Int, name : String }


type alias Model =
    { questions : List Question
    , currentIndex : Int
    , score : Int
    , newQuestion : Maybe Question
    }


port saveModel : Encode.Value -> Cmd msg


port storeModel : Encode.Value -> Cmd msg


emptyQuestion : Question
emptyQuestion =
    { text = ""
    , options = [ ( "A", "" ), ( "B", "" ), ( "C", "" ) ]
    , correctAnswer = ""
    , mark = 0
    , answers = []
    , subject = 0 ""
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
            , storeModel encodedNewModel
            )

        ResetInput ->
            ( { model | newQuestion = Just emptyQuestion }, Cmd.none )

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
                            storeModel encodedNewModel
                    in
                    ( newModel, storingagain )

        SubjectChange newSubject ->
            case model.newQuestion of
                Nothing ->
                    ( model, Cmd.none )

                Just newQuestion ->
                    let
                        updatedNewQuestion =
                            { newQuestion | subject = newSubject }
                    in
                    ( { model | newQuestion = Just updatedNewQuestion }, Cmd.none )

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

        -- ToggleAddingQuestions ->
        --     ( { model | addingQuestions = not model.addingQuestions }, Cmd.none )
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
    ( initialModel, saveModel (encodeModel initialModel) )



-- n
-- emptyQuestionEncoder : Encode.Value
-- emptyQuestionEncoder =
--     questionEncoder emptyQuestion


questionEncoder : Question -> Encode.Value
questionEncoder question =
    Encode.object
        [ ( "text", Encode.string question.text )
        , ( "subject", Encode.string question.text )
        , ( "options", Encode.list optionEncoder question.options )
        , ( "correctAnswer", Encode.string question.correctAnswer )
        , ( "mark", Encode.int question.mark )
        , ( "answers"
          , Encode.list Encode.string question.answers
          )
        , ( "subject", Encode.subject subjectEncoder )
        ]


subjectEncoder : Subject -> Encode.Value
subjectEncoder subject =
    Encode.object
        [ ( "id", Encode.int subject.id )
        , ( "name", Encode.string subject.name )
        ]


questionDecoder : Decoder Question
questionDecoder =
    Decode.map6
        Question
        (Decode.field "text" Decode.string)
        (Decode.field "options" (Decode.list optionDecoder))
        (Decode.field "correctAnswer" Decode.string)
        (Decode.field "mark" Decode.int)
        (Decode.field "answers" (Decode.list Decode.string))
        (Decode.field "subject" subjectDecoder)


subjectDecoder : Decoder Subject
subjectDecoder =
    Decode.map2
        Subject
        (Decode.field "id" Decode.int)
        (Decode.field "name" Decode.string)


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
    let
        maybeQuestion =
            List.head (List.drop model.currentIndex model.questions)
    in
    case maybeQuestion of
        Just question ->
            div [ class "flex flex-col " ]
                [ div [ class "flex flex-col items-center " ]
                    [ div [ class "flex flex-col w-full max-w-5xl " ]
                        [ div [ class "mb-2 italic" ]
                            [ label [ class "italic text-xl bg-[#FFFFFF]" ]
                                [ text "text" ]
                            ]
                        , div [ class "mb-4 " ]
                            [ input
                                [ type_ "text"
                                , onInput TextChange
                                , placeholder "Enter the content"
                                , class "border border-solid border-purple-200 h-16 text-center italic text-md text-center mt-4 hover:bg-gray-50 active:bg-gray-500  rounded-md w-full max-w-7xl"
                                ]
                                []
                            ]
                        ]
                    , div [ class "flex flex-col w-full max-w-5xl" ]
                        [ div [ class "mb-2 italic" ]
                            [ label [ class "italic text-xl bg-[#FFFFFF]" ]
                                [ text "correctAnswer" ]
                            ]
                        , div [ class "mb-4" ]
                            [ input
                                [ type_ "text"
                                , onInput CorrectAnserChange
                                , placeholder "Enter the correct answer"
                                , class "border border-solid border-purple-200 h-16 text-center italic text-md hover:bg-gray-50 active:bg-gray-500 w-full max-w-7xl rounded-md text-center mt-4"
                                ]
                                []
                            ]
                        ]
                    , div [ class "flex flex-col w-full max-w-5xl" ]
                        [ div [ class "mb-2 italic" ]
                            [ label [ class "italic text-xl bg-[#FFFFFF]" ]
                                [ text "Option 1" ]
                            ]
                        , div [ class "mb-4 " ]
                            [ input
                                [ type_ "text"
                                , placeholder "Enter option 1"
                                , onInput (OptionChange "A")
                                , class "border border-solid border-purple-200 h-16 text-center italic text-md hover:bg-gray-50 active:bg-gray-500 w-full max-w-4xl rounded-md text-center mt-4  w-full max-w-7xl"
                                ]
                                []
                            ]
                        ]
                    , div [ class "flex flex-col w-full max-w-5xl" ]
                        [ div [ class "mb-2 italic" ]
                            [ label [ class "italic text-xl bg-[#FFFFFF]" ]
                                [ text "Option 2" ]
                            ]
                        , div [ class "mb-4" ]
                            [ input
                                [ type_ "text"
                                , onInput (OptionChange "B")
                                , placeholder "Enter option 2"
                                , class "border border-solid border-purple-200 h-16 text-center italic text-md hover:bg-gray-50 active:bg-gray-500 rounded-md w-full max-w-4xl text-center mt-4 w-full max-w-7xl"
                                ]
                                []
                            ]
                        ]
                    , div [ class "flex flex-col w-full max-w-5xl" ]
                        [ div [ class "mb-2 text-sm italic" ]
                            [ label [ class "text-xl bg-[#FFFFFF]" ]
                                [ text "Option 3" ]
                            ]
                        , div [ class "mb-4" ]
                            [ input
                                [ type_ "text"
                                , onInput (OptionChange "C")
                                , placeholder "Enter option 3"
                                , class "border border-solid border-[#F0EBF5] h-16 text-center italic text-md hover:bg-gray-50 active:bg-gray-500 rounded-md w-full max-w-4xl text-center mt-4"
                                , placeholder "Enter option 3 "
                                , class "border border-solid border-[#F0EBF5]  h-16 text-center italic text-md hover:bg-gray-50 active:bg-gray-5 rounded-md w-full  max-w-7xl text-center mt-4"
                                ]
                                []
                            ]
                        ]
                    , div [ class "flex flex-col w-full max-w-5xl  " ]
                        [ div [ class "mb-2  italic" ]
                            [ label [ class "talic text-xl bg-[#FFFFFF]" ]
                                [ text "mark" ]
                            ]
                        , div [ class "mb-4  " ]
                            [ input
                                [ type_ "number"
                                , placeholder "Enter the mark "
                                , class " border   h-16 border-[#F0EBF5]  active:border- text-center italic text-md hover:bg-gray-50 active:bg-gray-50 w-full  max-w-4xl rounded-md text-center mt-4 w-full max-w-7xl "
                                , onInput MarkChange
                                ]
                                []
                            ]
                        ]
                    , div [ class "flex gap-10  w-full max-w-4xl" ]
                        [ div [ onClick <| Debug.log "Add button clicked!" StorageNewQ, class "text-center font-semibold italic text-white bg-purple-600 h-16  text-xl rounded-lg flex items-center justify-center mt-[15px] w-full max-w-5xl" ]
                            [ text "Add!" ]
                        , a [ href "/Evalute", class "text-center font-semibold italic text-black hover:bg-purple-600 hover:text-white h-16  text-xl rounded-lg flex items-center justify-center mt-[15px] w-full max-w-5xl " ] [ text "See Question" ]
                        ]
                    ]
                ]

        Nothing ->
            div [ class "flex flex-col items-center" ]
                [ div [ class "text-center mt-64 font-semibold text-2xl italic" ]
                    [ text "No questions yet" ]
                , div [ onClick StorageNewQ, class "text-center font-semibold italic text-white bg-purple-600 h-16 w-full max-w-[250px] text-xl rounded-lg flex items-center justify-center mt-[200px] w-full max-w-5xl" ]
                    [ text "Create One!" ]
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
