module Main exposing (main)

import Browser
import Html exposing (Html, button, div, input, label, span, text)
import Html.Attributes exposing (checked, class, classList, disabled, id, name, type_, value)
import Html.Events exposing (onClick)
import Json.Decode exposing (Value)
import Msg exposing (Msg(..))


type Msg
    = NextQuestion
    | PreviousQuestion
    | SelectOption Int String


type alias Question =
    { text : String
    , options : List ( String, String )
    , correctAnswer : String
    , mark : Int
    , answers : List String
    }


questions : List Question
questions =
    [ { text = "If M is mass of water that rises in capillary tube of radius ‘r’, then mass of water rising in a capillary tube of radius ‘2r’ is?"
      , options = [ ( "A", "Paris" ), ( "B", "Madrid" ), ( "C", "Rome" ), ( "D", "Berlin" ) ]
      , correctAnswer = "A"
      , mark = 2
      , answers = []
      }
    , { text = "What is the largest organ in the human body?"
      , options = [ ( "A", "Heart" ), ( "B", "Lungs" ) ]
      , correctAnswer = "B"
      , mark = 2
      , answers = []
      }
    , { text = "What is the largest continent?"
      , options = [ ( "A", "assia" ), ( "B", "america" ) ]
      , correctAnswer = "B"
      , mark = 2
      , answers = []
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
            in
            if isLastQuestion then
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
    Sub.none


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
            div [ class "flex  flex-col items-center mt-[200px] font-Rubik " ]
                [ div [ class " font-bold text-3xl " ] [ text "Quiz" ]
                , questionView model.currentIndex
                    question
                , div
                    [ class " flex space-x-28" ]
                    [ if model.currentIndex == 0 then
                        text ""

                      else
                        button [ onClick PreviousQuestion, class "  w-48 h-16 mt-10 focus:bg-[#FFC700]" ] [ text "Previous" ]
                    , if model.currentIndex == (List.length model.questions - 1) then
                        button [ class "  w-48 h-16 mt-10 focus:bg-[#FFC700]" ] [ text "Done" ]

                      else
                        button [ onClick NextQuestion, disabled (not isAnswerSelected), class "bg-[#FFC700] w-48 h-16 mt-10" ] [ text "Next" ]
                    ]
                , if isLastQuestion then
                    div [ class "mt-10" ]
                        [ text ("Your score is: " ++ String.fromInt model.score) ]

                  else
                    text ""
                ]

        Nothing ->
            div [] [ text "No questions found." ]


questionView : Int -> Question -> Html Msg
questionView index question =
    div [ id (String.fromInt index) ]
        [ div [ class " text-xl mb-10" ] [ text (String.fromInt (index + 1) ++ ") " ++ question.text) ]
        , div [ class " flex flex-col  gap-6" ]
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
            [ ( "bg-[#8419FF] text-white", isChecked )
            , ( "border border-solid  border-1.5 solid border-[#F0EBF5]  rounded-xl gap-6 px-10 w-full py-4 focus:bg-[#8419FF]"
              , True
              )
            ]
        , onClick
            (onSelect optionLabel)
        ]
        [ span [ class "text-[#F0EBF5]" ] [ text optionLabel ], text (" " ++ optionValue) ]
