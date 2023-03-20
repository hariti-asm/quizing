module Main exposing (main)

import Browser
import Html exposing (Html, button, div, input, label, text)
import Html.Attributes exposing (class, for, id, name, src, style, type_)
import Html.Events exposing (onClick)
import Msg exposing (Msg(..))


type Msg
    = MakeQuestions String
    | AddQuestion
    | GetQuestions (Maybe String)


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

        GetQuestions maybeName ->
            ( model, Cmd.none )



-- questionView index question =


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


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Quiz" ]
        , div []
            [ button [ onClick AddQuestion ] [ text "Add Question" ]
            , button [ onClick (GetQuestions Nothing) ] [ text "Get Questions" ]
            ]
        , div []
            (List.indexedMap questionView model.questions)
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
