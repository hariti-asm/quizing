module Main exposing (main)

import Browser
import Html exposing (Html, button, div, input, label, text)
import Html.Attributes exposing (class, for, id, name, src, style, type_)
import Html.Events exposing (onClick)
import Json.Decode as Decode
import Json.Encode as Encode
import Msg exposing (Msg(..))


type Msg
    = MakeQuiz String
    | AddQuestion String
    | GetQuiz String


type alias Question =
    { text : String
    , options : List String
    , correctAnswer : Int
    }


questions : List Question
questions =
    [ { text = "What is the capital of France?"
      , options = [ "Paris", "Madrid", "Rome", "Berlin" ]
      , correctAnswer = 1
      }
    , { text = "What is the largest organ in the human body?"
      , options = [ "Heart", "Lungs", "Liver", "Skin" ]
      , correctAnswer = 3
      }

    -- add more questions
    ]


type alias Model =
    { questions : List Question
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MakeQuiz name ->
            let
                newQuestion =
                    { text = name
                    , options = [ "Option A", "Option B", "Option C" ]
                    , correctAnswer = 0
                    }
            in
            ( { model | questions = newQuestion :: model.questions }, Cmd.none )

        AddQuestion _ ->
            ( model, Cmd.none )

        GetQuiz name ->
            ( model, Cmd.none )


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { questions = questions }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Debug.todo "TODO"


encodeQuestions : List Question -> Encode.Value
encodeQuestions questionss =
    Encode.list questionEncoder questionss


decodeQuestions : Decode.Decoder (List Question)
decodeQuestions =
    Decode.list questionDecoder


questionEncoder : Question -> Encode.Value
questionEncoder question =
    Encode.object
        [ ( "text", Encode.string question.text )
        , ( "options", Encode.list Encode.string question.options )
        , ( "correctAnswer", Encode.int question.correctAnswer )
        ]


questionDecoder : Decode.Decoder Question
questionDecoder =
    Decode.map3 Question
        (Decode.field "text" Decode.string)
        (Decode.field "options" (Decode.list Decode.string))
        (Decode.field "correctAnswer" Decode.int)


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Quiz" ]
        , div []
            [ button [ onClick MakeQuiz ] [ text "Make Quiz" ]
            , button [ onClick GetQuiz ] [ text "Get Quiz" ]
            ]
        , div []
            (List.indexedMap (\index question -> questionView index question) model.questions)
        ]


questionView : Int -> Question -> Html Msg
questionView index question =
    div [ id (String.fromInt index) ]
        [ div [] [ text question.text ]
        , div []
            (List.indexedMap (optionView question.correctAnswer) question.options)
        ]


optionView : Int -> Int -> String -> Html Msg
optionView correctAnswer index option =
    let
        styleClass =
            if correctAnswer == index then
                "correct"

            else
                "incorrect"
    in
    div [ class styleClass ]
        [ label [ for (String.fromInt index) ] [ text option ]
        , input [ type_ "radio", name (String.fromInt index) ] []
        ]
