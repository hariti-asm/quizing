module Main exposing (main)

import Browser
import Html exposing (Html, button, div, input, label, text)
import Html.Attributes exposing (class, for, id, name, src, style, type_)
import Html.Events exposing (onClick)
import Json.Decode as Decode exposing (Value)
import Json.Encode as Encode
import Msg exposing (Msg(..))


type Msg
    = GetQuiz
    | NextQuestion
    | PreviousQuestion


type alias Question =
    { text : String
    , options : List ( String, String )
    , correctAnswer : String
    , index : Int
    }


questions : List Question
questions =
    [ { text = "What is the capital of France?"
      , options = [ ( "A", "Paris" ), ( "B", "Madrid" ), ( "C", "Rome" ), ( "C", "Berlin" ) ]
      , correctAnswer = "A"
      , index = 0
      }
    , { text = "What is the largest organ in the human body?"
      , options = [ ( "A", "Heart" ), ( "B", "Lungs" ) ]
      , correctAnswer = "B"
      , index = 1
      }
    , { text = "What is the largest continent?"
      , options = [ ( "A", "assia" ), ( "B", "america" ) ]
      , correctAnswer = "B"
      , index = 1
      }
    ]



-- add more questions


type alias Model =
    { questions : List Question
    , currentIndex : Int
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- MakeQuiz ->
        --     let
        --         newQuestion =
        --             { text = ""
        --             , options = []
        --             , correctAnswer = ""
        --             }
        --     in
        --     ( { model | questions = newQuestion :: model.questions }, Cmd.none )
        GetQuiz ->
            ( model, Cmd.none )

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


main : Program Value Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- encodeQuestions : List Question -> Encode.Value
-- encodeQuestions questionss =
--     Encode.list questionEncoder questionss
-- decodeQuestions : Decode.Decoder (List Question)
-- decodeQuestions =
--     Decode.list questionDecoder
-- questionEncoder : Question -> Encode.Value
-- questionEncoder question =
--     Encode.object
--         [ ( "text", Encode.string question.text )
--         , ( "options", Encode.list Encode.string question.options )
--         , ( "correctAnswer", Encode.int question.correctAnswer )
--         ]
-- questionDecoder : Decode.Decoder Question
-- questionDecoder =
--     Decode.map3 Question
--         (Decode.field "text" Decode.string)
--         (Decode.field "options" (Decode.list Decode.string))
--         (Decode.field "correctAnswer" Decode.int)
-- port saveModel : Encode.Value -> Cmd msg


init : Value -> ( Model, Cmd Msg )
init _ =
    -- let
    --     initialModel =
    --         Decode.decodeValue Decode.string flags
    --             |> Result.withDefault ""
    --             |> Decode.decodeString decodeQuestions
    --             |> Result.withDefault []
    -- in
    -- ( { questions = initialModel }, Cmd.none )
    ( { questions = questions, currentIndex = 0 }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Debug.todo "TODO"


view : Model -> Html Msg
view model =
    let
        maybeQuestion =
            List.head model.questions
    in
    case maybeQuestion of
        Just question ->
            div []
                [ div [] [ text "Quiz" ]
                , questionView 0 question
                , div []
                    [ button [ onClick NextQuestion ] [ text "Next" ]
                    , button [ onClick PreviousQuestion ] [ text "Previous " ]
                    ]
                ]

        Nothing ->
            div [] [ text "No questions found." ]


questionView : Int -> Question -> Html Msg
questionView index question =
    div [ id (String.fromInt index) ]
        [ div [] [ text question.text ]
        , div []
            (List.map optionView question.options)
        ]


optionView : ( String, String ) -> Html Msg
optionView ( option1, option2 ) =
    let
        styleClass =
            ""

        -- if correctAnswer == index then
        --     "correct"
        -- else
        --     "incorrect"
    in
    div [ class styleClass ]
        [ label [ for option1 ] [ text option2 ]
        , input [ type_ "checkbox", name option1 ] []
        ]
