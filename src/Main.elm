module Main exposing (main)

import Browser
import Html exposing (Html, div, input, label, text)
import Html.Attributes exposing (id, name, src, style, type_)
import Msg exposing (Msg(..))
import VitePluginHelper


type Msg
    = MakeQuestions String
    | AddQuestion
    | GetQuestions


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
        MakeQuestions name ->
            let
                newQuestion =
                    { text = name
                    , options = [ "Option A", "Option B", "Option C" ]
                    , correctAnswer = 0
                    }
            in
            ( { model | questions = newQuestion :: model.questions }, Cmd.none )

        AddQuestion ->
            ( model, Cmd.none )

        GetQuestions ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Exam Questions" ]
        , div [] (List.indexedMap questionView model.questions)
        ]


questionView : Int -> Question -> Html Msg
questionView index question =
    div [ style [ ( "margin-bottom", "20px" ) ] ]
        [ div [] [ text <| String.fromInt (index + 1) ++ ". " ++ question.text ]
        , div [] (List.indexedMap optionView question.options)
        ]


optionView : Int -> String -> Html Msg
optionView index option =
    div [ style [ ( "margin-left", "20px" ) ] ]
        [ input [ type_ "radio", name "option", id <| "option-" ++ String.fromInt index ] []
        , label [ "option-" ++ String.fromInt ] [ text option ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = ( { questions = questions }, Cmd.none )
        , update = update
        , view = view
        }
