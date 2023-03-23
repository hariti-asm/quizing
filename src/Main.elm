module Main exposing (main)

import Browser
import Html exposing (Html, button, div, input, label, text)
import Html.Attributes exposing (checked, class, disabled, for, id, list, name, src, style, type_, value)
import Html.Events exposing (onClick)
import Json.Decode exposing (Value)
import Msg exposing (Msg(..))
import Set exposing (Set)


type Msg
    = GetQuiz
    | NextQuestion
    | PreviousQuestion
    | SelectOption String


type alias Question =
    { text : String
    , options : List ( String, String )
    , correctAnswer : String
    , index : Int
    , mark : Int
    , answeredCorrectly : Bool
    , answer : Maybe String
    }


questions : List Question
questions =
    [ { text = "What is the capital of France?"
      , options = [ ( "A", "Paris" ), ( "B", "Madrid" ), ( "C", "Rome" ), ( "D", "Berlin" ) ]
      , correctAnswer = "A"
      , index = 0
      , mark = 2
      , answeredCorrectly = False
      , answer = Nothing
      }
    , { text = "What is the largest organ in the human body?"
      , options = [ ( "A", "Heart" ), ( "B", "Lungs" ) ]
      , correctAnswer = "B"
      , index = 1
      , mark = 2
      , answeredCorrectly = False
      , answer = Nothing
      }
    , { text = "What is the largest continent?"
      , options = [ ( "A", "assia" ), ( "B", "america" ) ]
      , correctAnswer = "B"
      , index = 1
      , mark = 2
      , answeredCorrectly = False
      , answer = Nothing
      }
    ]



-- add more questions


type alias Model =
    { questions : List Question
    , currentIndex : Int
    , score : Int
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
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

        SelectOption selectedOption ->
            let
                question =
                    List.indexedMap
                        (\index q ->
                            if index == model.currentIndex then
                                { q | answer = Just selectedOption }

                            else
                                q
                        )
                        model.questions
            in
            ( { model | questions = question }, Cmd.none )


main : Program Value Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : Value -> ( Model, Cmd Msg )
init _ =
    ( { questions = questions, currentIndex = 0, score = 0 }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Debug.todo "TODO"


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
                    case question.answer of
                        Just _ ->
                            True

                        Nothing ->
                            False
            in
            div []
                [ div [] [ text "Quiz" ]
                , questionView 0 question
                , div []
                    [ button [ onClick NextQuestion, disabled (not isAnswerSelected) ] [ text "Next" ]
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
            (List.map viewOption question.options)
        ]


viewOption : ( String, String ) -> Html Msg
viewOption ( optionText, optionValue ) =
    label []
        [ input
            [ type_ "radio"
            , name "option"
            , value optionValue
            ]
            []
        , text optionText
        ]
