module Quizes exposing (..)

import Html exposing (Html, button, div, table, tbody, td, text, th, thead, tr)
import Html.Events exposing (onClick)
import Msg exposing (Msg)


type alias Quiz =
    { id : Int
    , subject : String
    }


type Msg
    = EditQuiz Int


quizes : List Quiz
quizes =
    [ { id = 1, subject = "Mathematics" }
    , { id = 2, subject = "Science" }
    , { id = 3, subject = "History" }
    , { id = 4, subject = "Physics" }
    , { id = 5, subject = "Philosophy" }
    ]


type alias Model =
    { quizes : List Quiz
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        EditQuiz id ->
            ( model, Cmd.none )


init : ( Model, Cmd Msg )
init =
    ( { quizes = quizes }, Cmd.none )


viewQuizTable : List Quiz -> Html msg
viewQuizTable quizzes =
    let
        viewQuizRow quiz =
            tr []
                [ td [] [ text <| String.fromInt quiz.id ]
                , td [] [ text quiz.subject ]
                , td []
                    [ button [] [ text "View" ]
                    ]
                , td [] [ button [] [ text "Edit" ] ]
                ]
    in
    table []
        [ thead [] [ tr [] [ th [] [ text "ID" ], th [] [ text "Subject" ], th [] [ text "view" ], th [] [ text "Edit" ] ] ]
        , tbody [] (List.map viewQuizRow quizes)
        ]


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ text "hello from quizes page" ]
        , div
            []
            [ viewQuizTable
                quizes
            ]
        ]
