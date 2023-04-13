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
        
     {- component -}
        node "link"
        [ Attr.rel "stylesheet"
        , Attr.href "https://demos.creative-tim.com/notus-js/assets/styles/tailwind.css"
        ]
        []
    ,     node "link"
        [ Attr.rel "stylesheet"
        , Attr.href "https://demos.creative-tim.com/notus-js/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css"
        ]
        []
    ,     section
        [ Attr.class "py-1 bg-blueGray-50"
        ]
        [ div
            [ Attr.class "w-full xl:w-8/12 mb-12 xl:mb-0 px-4 mx-auto mt-24"
            ]
            [ div
                [ Attr.class "relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-lg rounded "
                ]
                [ div
                    [ Attr.class "rounded-t mb-0 px-4 py-3 border-0"
                    ]
                    [ div
                        [ Attr.class "flex flex-wrap items-center"
                        ]
                        [ div
                            [ Attr.class "relative w-full px-4 max-w-full flex-grow flex-1"
                            ]
                            [ h3
                                [ Attr.class "font-semibold text-base text-blueGray-700"
                                ]
                                [ text "Page Visits" ]
                            ]
                        , div
                            [ Attr.class "relative w-full px-4 max-w-full flex-grow flex-1 text-right"
                            ]
                            [ button
                                [ Attr.class "bg-indigo-500 text-white active:bg-indigo-600 text-xs font-bold uppercase px-3 py-1 rounded outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
                                , Attr.type_ "button"
                                ]
                                [ text "See all" ]
                            ]
                        ]
                    ]
                , div
                    [ Attr.class "block w-full overflow-x-auto"
                    ]
                    [ table
                        [ Attr.class "items-center bg-transparent w-full border-collapse "
                        ]
                        [ thead []
                            [ tr []
                                [ th
                                    [ Attr.class "px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                                    ]
                                    [ text "Page name" ]
                                , th
                                    [ Attr.class "px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                                    ]
                                    [ text "Visitors" ]
                                , th
                                    [ Attr.class "px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                                    ]
                                    [ text "Unique users" ]
                                , th
                                    [ Attr.class "px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                                    ]
                                    [ text "Bounce rate" ]
                                ]
                            ]
                        , tbody []
                            [ tr []
                                [ th
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left text-blueGray-700 "
                                    ]
                                    [ text "/argon/" ]
                                , td
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 "
                                    ]
                                    [ text "4,569" ]
                                , td
                                    [ Attr.class "border-t-0 px-6 align-center border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
                                    ]
                                    [ text "340" ]
                                , td
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
                                    ]
                                    [ i
                                        [ Attr.class "fas fa-arrow-up text-emerald-500 mr-4"
                                        ]
                                        []
                                    , text "46,53%" ]
                                ]
                            , tr []
                                [ th
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left text-blueGray-700"
                                    ]
                                    [ text "/argon/index.html" ]
                                , td
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
                                    ]
                                    [ text "3,985" ]
                                , td
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
                                    ]
                                    [ text "319" ]
                                , td
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
                                    ]
                                    [ i
                                        [ Attr.class "fas fa-arrow-down text-orange-500 mr-4"
                                        ]
                                        []
                                    , text "46,53%" ]
                                ]
                            , tr []
                                [ th
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left text-blueGray-700"
                                    ]
                                    [ text "/argon/charts.html" ]
                                , td
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
                                    ]
                                    [ text "3,513" ]
                                , td
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
                                    ]
                                    [ text "294" ]
                                , td
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
                                    ]
                                    [ i
                                        [ Attr.class "fas fa-arrow-down text-orange-500 mr-4"
                                        ]
                                        []
                                    , text "36,49%" ]
                                ]
                            , tr []
                                [ th
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left text-blueGray-700"
                                    ]
                                    [ text "/argon/tables.html" ]
                                , td
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
                                    ]
                                    [ text "2,050" ]
                                , td
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
                                    ]
                                    [ text "147" ]
                                , td
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
                                    ]
                                    [ i
                                        [ Attr.class "fas fa-arrow-up text-emerald-500 mr-4"
                                        ]
                                        []
                                    , text "50,87%" ]
                                ]
                            , tr []
                                [ th
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left text-blueGray-700"
                                    ]
                                    [ text "/argon/profile.html" ]
                                , td
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
                                    ]
                                    [ text "1,795" ]
                                , td
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
                                    ]
                                    [ text "190" ]
                                , td
                                    [ Attr.class "border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
                                    ]
                                    [ i
                                        [ Attr.class "fas fa-arrow-down text-red-500 mr-4"
                                        ]
                                        []
                                    , text "46,53%" ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        , footer
            [ Attr.class "relative pt-8 pb-6 mt-16"
            ]
            [ div
                [ Attr.class "container mx-auto px-4"
                ]
                [ div
                    [ Attr.class "flex flex-wrap items-center md:justify-between justify-center"
                    ]
                    [ div
                        [ Attr.class "w-full md:w-6/12 px-4 mx-auto text-center"
                        ]
                        [ div
                            [ Attr.class "text-sm text-blueGray-500 font-semibold py-1"
                            ]
                            [ text "Made with", a
                                [ Attr.href "https://www.creative-tim.com/product/notus-js"
                                , Attr.class "text-blueGray-500 hover:text-gray-800"
                                , Attr.target "_blank"
                                ]
                                [ text "Notus JS" ]
                            , text "by", a
                                [ Attr.href "https://www.creative-tim.com"
                                , Attr.class "text-blueGray-500 hover:text-blueGray-800"
                                , Attr.target "_blank"
                                ]
                                [ text "Creative Tim" ]
                            , text "." ]
                        ]
                    ]
                ]
            ]
        ]   
