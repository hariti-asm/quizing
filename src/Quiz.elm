port module Quiz exposing (Model, Msg, init, update, view)

import Browser
import Html exposing (Html, button, div, input, label, span, text)
import Html.Attributes exposing (checked, class, classList, disabled, id, name, placeholder, type_, value)
import Html.Events exposing (onClick, onInput)
import Json.Decode as Decode exposing (Decoder, Value)
import Json.Encode as Encode
import Msg exposing (Msg(..))


type Msg
    = NextQuestion
    | PreviousQuestion
    | SelectOption Int String
    | AddNewQuestion


type alias Question =
    { text : String
    , options : List ( String, String )
    , correctAnswer : String
    , mark : Int
    , answers : List String
    }



-- add more questions


type alias Model =
    { questions : List Question
    , currentIndex : Int
    , score : Int
    , newQuestion : Maybe Question
    }


port saveModel : Encode.Value -> Cmd msg


update : Msg -> Model -> Question -> ( Model, Cmd Msg )
update msg model question_ =
    case msg of
        AddNewQuestion ->
            let
                newQuestion =
                    { text = ""
                    , options = []
                    , correctAnswer = ""
                    , mark = 0
                    , answers = []
                    }
            in
            ( { model | newQuestion = Just newQuestion }, saveModel (questionEncoder newQuestion) )

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


init : Value -> ( Model, Cmd Msg )
init flags =
    let
        initialModel =
            Decode.decodeValue decodeModel flags
                |> Result.withDefault { questions = [], currentIndex = 0, score = 0, newQuestion = Nothing }
    in
    ( initialModel, saveModel (encodeModel initialModel) )


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
        (Decode.field "labdel" Decode.string)
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
        [ ( "questions", Encode.list questionEncoder model.questions )
        , ( "currentIndex", Encode.int model.currentIndex )
        , ( "score", Encode.int model.score )
        ]


decodeModel : Decode.Decoder Model
decodeModel =
    Decode.map4 Model
        (Decode.field "questions" (Decode.list questionDecoder))
        (Decode.field "currentIndex" Decode.int)
        (Decode.field "score" Decode.int)
        (Decode.succeed Nothing)


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
            div [ class "flex  flex-col items-center mt-[200px] font-Rubik" ]
                [ div [ class "font-bold text-4xl" ] [ text "Quiz" ]
                , questionView model.currentIndex question
                , div [ class "flex space-x-28" ]
                    [ if model.currentIndex == 0 then
                        text ""

                      else
                        button [ onClick PreviousQuestion, class "w-48 h-16 mt-10 focus:bg-[#FFC700]" ] [ text "Previous" ]
                    , if model.currentIndex == (List.length model.questions - 1) then
                        text ""

                      else
                        button [ onClick NextQuestion, disabled (not isAnswerSelected), class "bg-[#FFC700] w-48 h-16 mt-10" ] [ text "Next" ]
                    ]
                , if isLastQuestion then
                    div [ class "mt-10 text-2xl font-semibold italic" ]
                        [ text ("Your score is: " ++ String.fromInt model.score) ]

                  else
                    text ""
                ]

        Nothing ->
            case model.newQuestion of
                Nothing ->
                    div [ onClick AddNewQuestion ]
                        [ text "Create one!" ]

                Just question ->
                    div [ class "" ]
                        [ div [ class "  flex flex-col ml-[300px] w-full   " ]
                            [ div [ class "flex flex-col   " ]
                                [ div [ class "mb-2  italic " ]
                                    [ label [ class " talic text-xl " ]
                                        [ text "text" ]
                                    ]
                                , div [ class "mb-4    " ]
                                    [ input [ type_ "text", placeholder "Enter the content ", class " border border-solid border-[#F0EBF5]  h-16 text-center italic text-md text-center mt-4 hover:bg-gray-50 active:bg-gray-5 w-full  max-w-4xl rounded-md" ]
                                        []
                                    ]
                                ]
                            , div [ class "flex flex-col  " ]
                                [ div [ class "mb-2  italic" ]
                                    [ label [ class " talic text-xl " ]
                                        [ text "correctAnswer" ]
                                    ]
                                , div [ class "mb-4 " ]
                                    [ input [ type_ "text", placeholder "Enter the correct answer ", class " border border-solid border-[#F0EBF5]  h-16 text-center italic text-md hover:bg-gray-50 active:bg-gray-5  w-full  max-w-4xl rounded-mdtext-center mt-4" ]
                                        []
                                    ]
                                ]
                            , div [ class "flex flex-col " ]
                                [ div [ class "mb-2  italic" ]
                                    [ label [ class " talic text-xl" ]
                                        [ text "Option 1" ]
                                    ]
                                , div [ class "mb-4 " ]
                                    [ input [ type_ "text", placeholder "Enter option 1", class "  border border-solid border-[#F0EBF5]  h-16 text-center italic text-md hover:bg-gray-50 active:bg-gray-5 w-full  max-w-4xl rounded-mdtext-center mt-4" ]
                                        []
                                    ]
                                ]
                            , div [ class "flex flex-col  " ]
                                [ div [ class "mb-2  italic" ]
                                    [ label [ class "text-xl " ]
                                        [ text "Option 2" ]
                                    ]
                                , div [ class "mb-4  " ]
                                    [ input [ type_ "text", placeholder "Enter option 2", class " border border-solid border-[#F0EBF5]  h-16 text-center italic text-md hover:bg-gray-50 active:bg-gray-5 rounded-md w-full  max-w-4xl text-center mt-4" ]
                                        []
                                    ]
                                ]
                            , div [ class "flex flex-col " ]
                                [ div [ class "mb-2 text-sm  italic" ]
                                    [ label [ class " text-xl " ]
                                        [ text "Option 3" ]
                                    ]
                                , div [ class "mb-4" ]
                                    [ input [ type_ "text", placeholder "Enter option 3 ", class "border border-solid border-[#F0EBF5]  h-16 text-center italic text-md hover:bg-gray-50 active:bg-gray-5 rounded-md w-full  max-w-4xl text-center mt-4" ]
                                        []
                                    ]
                                ]
                            , div [ class "flex flex-col  " ]
                                [ div [ class "mb-2  italic" ]
                                    [ label [ class "talic text-xl " ]
                                        [ text "mark" ]
                                    ]
                                , div [ class "mb-4  " ]
                                    [ input [ type_ "number", placeholder "Enter the mark ", class " border border-solid border-[#F0EBF5] h-16 text-center italic text-md hover:bg-gray-50 active:bg-gray-50 w-full  max-w-4xl rounded-md text-center mt-4" ]
                                        []
                                    ]
                                ]
                            ]
                        , div [ class " text-xl italic  mb-2 bg-[#8419FF] h-14 text-center w-full max-w-sm ml-[700px]  rounded-md  items-center text-white", onClick AddNewQuestion ]
                            [ text "Add new question" ]
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
