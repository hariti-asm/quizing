module Main exposing (main)

import Browser
import Html exposing (Html, button, div, input, label, text)
import Html.Attributes exposing (class, for, id, name, src, style, type_)
import Html.Events exposing (onClick)
import Json.Decode as Decode exposing (Value)
import Json.Encode as Encode
import Msg exposing (Msg(..))


type Msg
    = MakeQuiz
    | GetQuiz


type alias Question =
    { text : String
    , options : List ( String, String )
    , correctAnswer : String
    }


questions : List Question
questions =
    [ { text = "What is the capital of France?"
      , options = [ ( "A", "Paris" ), ( "B", "Madrid" ), ( "C", "Rome" ), ( "C", "Berlin" ) ]
      , correctAnswer = "A"
      }
    , { text = "What is the largest organ in the human body?"
      , options = [ ( "A", "Heart" ), ( "B", "Lungs" ) ]
      , correctAnswer = "B"
      }

    -- add more questions
    ]


type alias Model =
    { questions : List Question
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MakeQuiz ->
            -- ( model, Cmd.none )
            let
                newQuestion =
                    { text = ""
                    , options = []
                    , correctAnswer = ""
                    }
            in
            ( { model | questions = newQuestion :: model.questions }, Cmd.none )

        GetQuiz ->
            ( model, Cmd.none )


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
    ( { questions = questions }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Debug.todo "TODO"


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Quiz" ]
        , div []
            [ button [ onClick MakeQuiz ] [ text "Make Quiz" ]
            , button [] [ text "Get Quiz" ]
            ]
        , div []
            (List.indexedMap (\index question -> questionView index question) model.questions)
        ]


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
        , input [ type_ "radio", name option1 ] []
        ]
