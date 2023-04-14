module Pricing exposing (..)

import Html exposing (Html, a, br, div, h1, h2, hr, img, node, p, span, text)
import Html.Attributes exposing (alt, class, href, rel, src)


type alias Model =
    {}


type Msg
    = NoOp


view : Model -> Html Msg
view model =
    div []
        [ node "link"
            [ rel "preconnect"
            , href "https://fonts.gstatic.com"
            ]
            []
        , node "link"
            [ href "https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap"
            , rel "stylesheet"
            ]
            []
        , node "link"
            [ href "https://fonts.googleapis.com/icon?family=Material+Icons"
            , rel "stylesheet"
            ]
            []
        , div
            [ class "font-sans bg-gray-100"
            ]
            [ div
                [ class "min-h-screen flex justify-center items-center"
                ]
                [ div
                    [ class ""
                    ]
                    [ div
                        [ class "text-center font-semibold"
                        ]
                        [ h1
                            [ class "text-5xl"
                            ]
                            [ span
                                [ class "text-[#8419FF] tracking-wide"
                                ]
                                [ text "Flexible" ]
                            , span []
                                [ text "Plans" ]
                            ]
                        , p
                            [ class "pt-6 text-xl text-gray-400 font-normal w-full px-8 md:w-full"
                            ]
                            [ text "Choose a plan that works best for you and"
                            , br []
                                []
                            , text "your team."
                            ]
                        ]
                    , div
                        [ class "pt-24 flex flex-row"
                        ]
                        [ {- Basic Card -}
                          div
                            [ class "w-96 p-8 bg-white text-center rounded-3xl pr-16 shadow-xl"
                            ]
                            [ h1
                                [ class "text-black font-semibold text-2xl"
                                ]
                                [ text "Basic" ]
                            , p
                                [ class "pt-2 tracking-wide"
                                ]
                                [ span
                                    [ class "text-gray-400 align-top"
                                    ]
                                    [ text "$" ]
                                , span
                                    [ class "text-3xl font-semibold"
                                    ]
                                    [ text "10" ]
                                , span
                                    [ class "text-gray-400 font-medium"
                                    ]
                                    [ text "/ user" ]
                                ]
                            , hr
                                [ class "mt-4 border-1"
                                ]
                                []
                            , div
                                [ class "pt-8"
                                ]
                                [ p
                                    [ class "font-semibold text-gray-400 text-left"
                                    ]
                                    [ span
                                        [ class "material-icons align-middle"
                                        ]
                                        [ text "done" ]
                                    , span
                                        [ class "pl-2"
                                        ]
                                        [ text "Get started with"
                                        , span
                                            [ class "text-black"
                                            ]
                                            [ text "messaging" ]
                                        ]
                                    ]
                                , p
                                    [ class "font-semibold text-gray-400 text-left pt-5"
                                    ]
                                    [ span
                                        [ class "material-icons align-middle"
                                        ]
                                        [ text "done" ]
                                    , span
                                        [ class "pl-2"
                                        ]
                                        [ text "Flexible"
                                        , span
                                            [ class "text-black"
                                            ]
                                            [ text "team meetings" ]
                                        ]
                                    ]
                                , p
                                    [ class "font-semibold text-gray-400 text-left pt-5"
                                    ]
                                    [ span
                                        [ class "material-icons align-middle"
                                        ]
                                        [ text "done" ]
                                    , span
                                        [ class "pl-2"
                                        ]
                                        [ span
                                            [ class "text-black"
                                            ]
                                            [ text "5 TB" ]
                                        , text "cloud storage"
                                        ]
                                    ]
                                , a
                                    [ href "#"
                                    , class ""
                                    ]
                                    [ p
                                        [ class "w-full py-4 bg-[#A78BFA] mt-8 rounded-xl text-white"
                                        ]
                                        [ span
                                            [ class "font-medium"
                                            ]
                                            [ text "Choose Plan" ]
                                        , span
                                            [ class "pl-2 material-icons align-middle text-sm"
                                            ]
                                            [ text "east" ]
                                        ]
                                    ]
                                ]
                            ]
                        , {- StartUp Card -}
                          div
                            [ class "w-80 p-8 bg-gray-900 text-center rounded-3xl text-white border-4 shadow-xl border-white transform scale-125"
                            ]
                            [ h1
                                [ class "text-white font-semibold text-2xl"
                                ]
                                [ text "Startup" ]
                            , p
                                [ class "pt-2 tracking-wide"
                                ]
                                [ span
                                    [ class "text-gray-400 align-top"
                                    ]
                                    [ text "$" ]
                                , span
                                    [ class "text-3xl font-semibold"
                                    ]
                                    [ text "24" ]
                                , span
                                    [ class "text-gray-400 font-medium"
                                    ]
                                    [ text "/ user" ]
                                ]
                            , hr
                                [ class "mt-4 border-1 border-gray-600"
                                ]
                                []
                            , div
                                [ class "pt-8"
                                ]
                                [ p
                                    [ class "font-semibold text-gray-400 text-left"
                                    ]
                                    [ span
                                        [ class "material-icons align-middle"
                                        ]
                                        [ text "done" ]
                                    , span
                                        [ class "pl-2"
                                        ]
                                        [ text "All features in"
                                        , span
                                            [ class "text-white"
                                            ]
                                            [ text "Basic" ]
                                        ]
                                    ]
                                , p
                                    [ class "font-semibold text-gray-400 text-left pt-5"
                                    ]
                                    [ span
                                        [ class "material-icons align-middle"
                                        ]
                                        [ text "done" ]
                                    , span
                                        [ class "pl-2"
                                        ]
                                        [ text "Flexible"
                                        , span
                                            [ class "text-white"
                                            ]
                                            [ text "call scheduling" ]
                                        ]
                                    ]
                                , p
                                    [ class "font-semibold text-gray-400 text-left pt-5"
                                    ]
                                    [ span
                                        [ class "material-icons align-middle"
                                        ]
                                        [ text "done" ]
                                    , span
                                        [ class "pl-2"
                                        ]
                                        [ span
                                            [ class "text-white"
                                            ]
                                            [ text "15 TB" ]
                                        , text "cloud storage"
                                        ]
                                    ]
                                , a
                                    [ href "#"
                                    , class ""
                                    ]
                                    [ p
                                        [ class "w-full py-4 bg-[#A78BFA] mt-8 rounded-xl text-white"
                                        ]
                                        [ span
                                            [ class "font-medium"
                                            ]
                                            [ text "Choose Plan" ]
                                        , span
                                            [ class "pl-2 material-icons align-middle text-sm"
                                            ]
                                            [ text "east" ]
                                        ]
                                    ]
                                ]
                            , div
                                [ class "absolute top-4 right-4"
                                ]
                                [ p
                                    [ class "bg-[#8419FF] font-semibold px-4 py-1 rounded-full uppercase text-xs"
                                    ]
                                    [ text "Popular" ]
                                ]
                            ]
                        , {- Enterprise Card -}
                          div
                            [ class "w-96 p-8 bg-white text-center rounded-3xl pl-16 shadow-xl"
                            ]
                            [ h1
                                [ class "text-black font-semibold text-2xl"
                                ]
                                [ text "Enterprise" ]
                            , p
                                [ class "pt-2 tracking-wide"
                                ]
                                [ span
                                    [ class "text-gray-400 align-top"
                                    ]
                                    [ text "$" ]
                                , span
                                    [ class "text-3xl font-semibold"
                                    ]
                                    [ text "35" ]
                                , span
                                    [ class "text-gray-400 font-medium"
                                    ]
                                    [ text "/ user" ]
                                ]
                            , hr
                                [ class "mt-4 border-1"
                                ]
                                []
                            , div
                                [ class "pt-8"
                                ]
                                [ p
                                    [ class "font-semibold text-gray-400 text-left"
                                    ]
                                    [ span
                                        [ class "material-icons align-middle"
                                        ]
                                        [ text "done" ]
                                    , span
                                        [ class "pl-2"
                                        ]
                                        [ text "All features in"
                                        , span
                                            [ class "text-black"
                                            ]
                                            [ text "Startup" ]
                                        ]
                                    ]
                                , p
                                    [ class "font-semibold text-gray-400 text-left pt-5"
                                    ]
                                    [ span
                                        [ class "material-icons align-middle"
                                        ]
                                        [ text "done" ]
                                    , span
                                        [ class "pl-2"
                                        ]
                                        [ text "Growth"
                                        , span
                                            [ class "text-black"
                                            ]
                                            [ text "oriented" ]
                                        ]
                                    ]
                                , p
                                    [ class "font-semibold text-gray-400 text-left pt-5"
                                    ]
                                    [ span
                                        [ class "material-icons align-middle"
                                        ]
                                        [ text "done" ]
                                    , span
                                        [ class "pl-2"
                                        ]
                                        [ span
                                            [ class "text-black"
                                            ]
                                            [ text "Unlimited" ]
                                        , text "cloud storage"
                                        ]
                                    ]
                                , a
                                    [ href "#"
                                    , class ""
                                    ]
                                    [ p
                                        [ class "w-full py-4 bg-[#A78BFA] mt-8 rounded-xl text-white"
                                        ]
                                        [ span
                                            [ class "font-medium"
                                            ]
                                            [ text "Choose Plan" ]
                                        , span
                                            [ class "pl-2 material-icons align-middle text-sm"
                                            ]
                                            [ text "east" ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]


init : () -> ( Model, Cmd Msg )
init _ =
    ( {}, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )
