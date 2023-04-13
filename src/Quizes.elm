module Quizes exposing (..)
module Main exposing (main)

import Html exposing (Html, text, table, tr, th, td, tbody, button)
import Html.Events exposing (onClick)


type alias Quiz =
    { id : Int
    , subject : String
    }

quizzes : List Quiz
quizzes =
    [ { id = 1, subject = "Mathematics" }
    , { id = 2, subject = "Science" }
    , { id = 3, subject = "History" }
    ]


viewQuizTable : List Quiz -> Html msg
viewQuizTable quizzes =
    let
        viewQuizRow quiz =
            tr []
                [ td [] [ text <| String.fromInt quiz.id ]
                , td [] [ text quiz.subject ]
                , td [] [ button [ onClick <| MsgEditQuiz quiz.id ] [ text "Edit" ] ]
                ]
    in
    table []
        [ thead [] [ tr [] [ th [] [ text "ID" ], th [] [ text "Subject" ], th [] [ text "Edit" ] ] ]
        , tbody [] (List.map viewQuizRow quizzes)
        ]


main : Html msg
main =
    viewQuizTable quizzes

