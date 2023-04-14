module Quizes exposing (..)

import Html exposing (Html, a, button, div, footer, h3, i, node, section, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (class, href, rel, target, type_)
import Html.Events exposing (onClick)
import Msg exposing (Msg)


type alias Quiz =
    { id : Int
    , subject : String
    }


type Msg
    = EditQuiz Int



-- quizes : List Quiz
-- quizes =
--     [ { id = 1, subject = "Mathematics" }
--     , { id = 2, subject = "Science" }
--     , { id = 3, subject = "History" }
--     , { id = 4, subject = "Physics" }
--     , { id = 5, subject = "Philosophy" }
--     ]


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


quizes : List Quiz
quizes =
    [ { id = 1, subject = "Mathematics" }
    , { id = 2, subject = "Science" }
    , { id = 3, subject = "History" }
    , { id = 4, subject = "Physics" }
    , { id = 5, subject = "Philosophy" }
    ]


viewQuizTable : List Quiz -> Html msg
viewQuizTable quizzes =
   
    div
        []
        [ section
            [ class "py-1 bg-blueGray-50"
            ]
            [ div
                [ class "w-full xl:w-8/12 mb-12 xl:mb-0 px-4 mx-auto mt-24"
                ]
                [ div
                    [ class "relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-lg rounded "
                    ]
                    [ div
                        [ class "rounded-t mb-0 px-4 py-3 border-0"
                        ]
                        [ div
                            [ class "flex flex-wrap items-center"
                            ]
                            [ div
                                [ class "relative w-full px-4 max-w-full flex-grow flex-1"
                                ]
                                [ h3
                                    [ class "font-semibold text-base text-blueGray-700"
                                    ]
                                    [ text "Quizzes" ]
                                ]
                            , div
                                [ class "relative w-full px-4 max-w-full flex-grow flex-1 text-right"
                                ]
                                [ button
                                    [ class "bg-indigo-500 text-white active:bg-indigo-600 text-xs font-bold uppercase px-3 py-1 rounded outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
                                    , type_ "button"
                                    ]
                                    [ text "See all" ]
                                ]
                            ]
                        ]
                    , div
                        [ class "block w-full overflow-x-auto"
                        ]
                        [ table
                            [ class "items-center bg-transparent w-full border-collapse "
                            ]
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
                            [ thead []
                                [ tr []
                                    [ th
                                        [ class "px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                                        ]
                                        [ text |> String.fromInt quiz.id ]
                                    , th
                                        [ class "px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                                        ]
                                        [ text quiz.subject ]
                                    , th
                                        [ class "px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                                        ]
                                        [ text "View" ]
                                    ]
                                ]
                            , tbody [] (List.map viewQuizRow quizes)
                            ]
                        ]
                    , footer
                        [ class "relative pt-8 pb-6 mt-16"
                        ]
                        [ div
                            [ class "container mx-auto px-4"
                            ]
                            [ div
                                [ class "flex flex-wrap items-center md:justify-between justify-center"
                                ]
                                [ div
                                    [ class "w-full md:w-6/12 px-4 mx-auto text-center"
                                    ]
                                    [ div
                                        [ class "text-sm text-blueGray-500 font-semibold py-1"
                                        ]
                                        [ text "Made with"
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
