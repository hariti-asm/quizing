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
    div
        []
        [ section [ class "py-1 bg-blueGray-50" ]
            [ div [ class "w-full xl:w-8/12 mb-12 xl:mb-0 px-4 mx-auto mt-24" ]
                [ div [ class "relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-lg rounded " ]
                    [ div [ class "rounded-t mb-0 px-4 py-3 border-0" ]
                        [ div [ class "flex flex-wrap items-center" ]
                            [ div [ class "relative w-full px-4 max-w-full flex-grow flex-1" ]
                                [ h3 [ class "font-semibold text-base text-blueGray-700" ]
                                    [ text "Quizzes" ]
                                ]
                            ]
                        ]
                    , div
                        [ class "block w-full overflow-x-auto" ]
                        [ table [ class "items-center bg-transparent w-full border-collapse " ]
                            [ thead []
                                [ tr []
                                    [ th [ class "px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left" ]
                                        [ text "Id" ]
                                    , th
                                        [ class "px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left" ]
                                        [ text "Subject" ]
                                    , th
                                        [ class "px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left" ]
                                        [ text "View" ]
                                    , th
                                        [ class " px-6 bg-blueGray-500 text-blueGray-500 align-middle border border-solid borderGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold  text-left" ]
                                        [ text "Edit" ]
                                    ]
                                ]
                            , tbody [] (List.map viewQuizRow quizzes)
                            ]
                        ]
                    ]
                ]
            ]
                div
        [ Attr.class "flex flex-col"
        ]
        [ div
            [ Attr.class "overflow-x-auto sm:-mx-6 lg:-mx-8"
            ]
            [ div
                [ Attr.class "inline-block min-w-full py-2 sm:px-6 lg:px-8"
                ]
                [ div
                    [ Attr.class "overflow-hidden"
                    ]
                    [ table
                        [ Attr.class "min-w-full text-left text-sm font-light"
                        ]
                        [ thead
                            [ Attr.class "border-b font-medium dark:border-neutral-500"
                            ]
                            [ tr []
                                [ th
                                    [ Attr.scope "col"
                                    , Attr.class "px-6 py-4"
                                    ]
                                    [ text "#" ]
                                , th
                                    [ Attr.scope "col"
                                    , Attr.class "px-6 py-4"
                                    ]
                                    [ text "Subject" ]
                                , th
                                    [ Attr.scope "col"
                                    , Attr.class "px-6 py-4"
                                    ]
                                    [ text "View" ]
                                , th
                                    [ Attr.scope "col"
                                    , Attr.class "px-6 py-4"
                                    ]
                                    [ text "Edit" ]
                                ]
                            ]
                        , tbody []
                            [ tr
                                [ Attr.class "border-b transition duration-300 ease-in-out hover:bg-neutral-100 dark:border-neutral-500 dark:hover:bg-neutral-600"
                                ]
                                [ td
                                    [ Attr.class "whitespace-nowrap px-6 py-4 font-medium"
                                    ]
                                    [ text "2" ]
                                ]
                            ]
                        ]
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
                        [ button
                            [ class "text-sm text-blueGray-500 font-semibold py-1 font-bold text-5xl"
                            ]
                            [ text "+"
                            ]
                        ]
                    ]
                ]
            ]
        ]


view : Model -> Html Msg
view model =
    viewQuizTable model.quizes
