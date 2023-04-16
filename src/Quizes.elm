module Quizes exposing (..)

import Html exposing (Html, a, button, div, footer, h3, i, node, section, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (class, href, rel, scope, target, type_)
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


viewQuizTable quizzes =
    let
        viewQuizRow quiz =
            tr []
                [ td [ class "px-6 py-4 text-xm " ] [ text <| String.fromInt quiz.id ]
                , td [ class "px-6 py-4 text-xm" ] [ text quiz.subject ]
                , td [ class "px-6 py-4" ]
                    [ a [ href "/evaluate", class " focus:outline-none focus:text-indigo-600  w-14 bg-[#A78BFA]  text-md py-3 rounded-sm px-4 cursor-pointer hover:text-white" ] [ text "View" ]
                    ]
                , td [ class " px-6 py-4  " ]
                    [ a [ href "", class " focus:outline-none focus:text-indigo-600 text-m w-14 bg-[#A78BFA]  py-3 rounded-sm px-4 cursor-pointer hover:text-white" ] [ text "Edit" ]
                    ]
                ]
    in
    div
        [ class "flex flex-col"
        ]
        [ div
            [ class "overflow-x-auto sm:-mx-6 lg:-mx-8"
            ]
            [ div
                [ class "inline-block min-w-full py-2 sm:px-6 lg:px-8"
                ]
                [ div
                    [ class "overflow-hidden"
                    ]
                    [ table
                        [ class "min-w-full text-left text-sm font-light"
                        ]
                        [ thead
                            [ class "border-b font-medium dark:border-neutral-500"
                            ]
                            [ tr []
                                [ th
                                    [ scope "col"
                                    , class "px-6 py-4"
                                    ]
                                    [ text "#" ]
                                , th
                                    [ scope "col"
                                    , class "px-6 py-4"
                                    ]
                                    [ text "Subject" ]
                                , th
                                    [ scope "col"
                                    , class "px-6 py-4"
                                    ]
                                    [ text "View" ]
                                , th
                                    [ scope "col"
                                    , class "px-6 py-4 focus:outline-none focus:text-indigo-600 "
                                    ]
                                    [ text "Edit" ]
                                ]
                            ]
                        , tbody
                            [ class "border-b transition px-6 py-4 duration-300 ease-in-out dark:border-neutral-500 dark:hover:bg-neutral-600"
                            ]
                            (List.map viewQuizRow quizzes)
                        ]
                    ]
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
                        [ a
                            [ class "text-center font-semibold italic text-gray-900 bg-[#A78BFA] h-16 w-full max-w-[250px] text-xl  e rounded-lg flex items-center justify-center md:flex-none m-auto"
                            , href "/add"
                            ]
                            [ text "Add your Quiz"
                            ]
                        ]
                    ]
                ]
            ]
        ]


view : Model -> Html Msg
view model =
    viewQuizTable model.quizes
