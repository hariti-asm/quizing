module Pricing exposing (..)

import Html exposing (Html, a, div, h2, img, p, span, text)
import Html.Attributes exposing (alt, class, href, src)


type alias Model =
    {}


type Msg
    = NoOp


view : Model -> Html Msg
view model =
        {- component -}
        node "link"
        [ Attr.rel "preconnect"
        , Attr.href "https://fonts.gstatic.com"
        ]
        []
    ,     node "link"
        [ Attr.href "https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap"
        , Attr.rel "stylesheet"
        ]
        []
    ,     node "link"
        [ Attr.href "https://fonts.googleapis.com/icon?family=Material+Icons"
        , Attr.rel "stylesheet"
        ]
        []
    ,     body
        [ Attr.class "font-sans bg-gray-100"
        ]
        [ div
            [ Attr.class "min-h-screen flex justify-center items-center"
            ]
            [ div
                [ Attr.class ""
                ]
                [ div
                    [ Attr.class "text-center font-semibold"
                    ]
                    [ h1
                        [ Attr.class "text-5xl"
                        ]
                        [ span
                            [ Attr.class "text-blue-700 tracking-wide"
                            ]
                            [ text "Flexible" ]
                        , span []
                            [ text "Plans" ]
                        ]
                    , p
                        [ Attr.class "pt-6 text-xl text-gray-400 font-normal w-full px-8 md:w-full"
                        ]
                        [ text "Choose a plan that works best for you and", br []
                            []
                        , text "your team." ]
                    ]
                , div
                    [ Attr.class "pt-24 flex flex-row"
                    ]
                    [                     {- Basic Card -}
                    div
                        [ Attr.class "w-96 p-8 bg-white text-center rounded-3xl pr-16 shadow-xl"
                        ]
                        [ h1
                            [ Attr.class "text-black font-semibold text-2xl"
                            ]
                            [ text "Basic" ]
                        , p
                            [ Attr.class "pt-2 tracking-wide"
                            ]
                            [ span
                                [ Attr.class "text-gray-400 align-top"
                                ]
                                [ text "$" ]
                            , span
                                [ Attr.class "text-3xl font-semibold"
                                ]
                                [ text "10" ]
                            , span
                                [ Attr.class "text-gray-400 font-medium"
                                ]
                                [ text "/ user" ]
                            ]
                        , hr
                            [ Attr.class "mt-4 border-1"
                            ]
                            []
                        , div
                            [ Attr.class "pt-8"
                            ]
                            [ p
                                [ Attr.class "font-semibold text-gray-400 text-left"
                                ]
                                [ span
                                    [ Attr.class "material-icons align-middle"
                                    ]
                                    [ text "done" ]
                                , span
                                    [ Attr.class "pl-2"
                                    ]
                                    [ text "Get started with", span
                                        [ Attr.class "text-black"
                                        ]
                                        [ text "messaging" ]
                                    ]
                                ]
                            , p
                                [ Attr.class "font-semibold text-gray-400 text-left pt-5"
                                ]
                                [ span
                                    [ Attr.class "material-icons align-middle"
                                    ]
                                    [ text "done" ]
                                , span
                                    [ Attr.class "pl-2"
                                    ]
                                    [ text "Flexible", span
                                        [ Attr.class "text-black"
                                        ]
                                        [ text "team meetings" ]
                                    ]
                                ]
                            , p
                                [ Attr.class "font-semibold text-gray-400 text-left pt-5"
                                ]
                                [ span
                                    [ Attr.class "material-icons align-middle"
                                    ]
                                    [ text "done" ]
                                , span
                                    [ Attr.class "pl-2"
                                    ]
                                    [ span
                                        [ Attr.class "text-black"
                                        ]
                                        [ text "5 TB" ]
                                    , text "cloud storage" ]
                                ]
                            , a
                                [ Attr.href "#"
                                , Attr.class ""
                                ]
                                [ p
                                    [ Attr.class "w-full py-4 bg-blue-600 mt-8 rounded-xl text-white"
                                    ]
                                    [ span
                                        [ Attr.class "font-medium"
                                        ]
                                        [ text "Choose Plan" ]
                                    , span
                                        [ Attr.class "pl-2 material-icons align-middle text-sm"
                                        ]
                                        [ text "east" ]
                                    ]
                                ]
                            ]
                        ]
                    ,                     {- StartUp Card -}
                    div
                        [ Attr.class "w-80 p-8 bg-gray-900 text-center rounded-3xl text-white border-4 shadow-xl border-white transform scale-125"
                        ]
                        [ h1
                            [ Attr.class "text-white font-semibold text-2xl"
                            ]
                            [ text "Startup" ]
                        , p
                            [ Attr.class "pt-2 tracking-wide"
                            ]
                            [ span
                                [ Attr.class "text-gray-400 align-top"
                                ]
                                [ text "$" ]
                            , span
                                [ Attr.class "text-3xl font-semibold"
                                ]
                                [ text "24" ]
                            , span
                                [ Attr.class "text-gray-400 font-medium"
                                ]
                                [ text "/ user" ]
                            ]
                        , hr
                            [ Attr.class "mt-4 border-1 border-gray-600"
                            ]
                            []
                        , div
                            [ Attr.class "pt-8"
                            ]
                            [ p
                                [ Attr.class "font-semibold text-gray-400 text-left"
                                ]
                                [ span
                                    [ Attr.class "material-icons align-middle"
                                    ]
                                    [ text "done" ]
                                , span
                                    [ Attr.class "pl-2"
                                    ]
                                    [ text "All features in", span
                                        [ Attr.class "text-white"
                                        ]
                                        [ text "Basic" ]
                                    ]
                                ]
                            , p
                                [ Attr.class "font-semibold text-gray-400 text-left pt-5"
                                ]
                                [ span
                                    [ Attr.class "material-icons align-middle"
                                    ]
                                    [ text "done" ]
                                , span
                                    [ Attr.class "pl-2"
                                    ]
                                    [ text "Flexible", span
                                        [ Attr.class "text-white"
                                        ]
                                        [ text "call scheduling" ]
                                    ]
                                ]
                            , p
                                [ Attr.class "font-semibold text-gray-400 text-left pt-5"
                                ]
                                [ span
                                    [ Attr.class "material-icons align-middle"
                                    ]
                                    [ text "done" ]
                                , span
                                    [ Attr.class "pl-2"
                                    ]
                                    [ span
                                        [ Attr.class "text-white"
                                        ]
                                        [ text "15 TB" ]
                                    , text "cloud storage" ]
                                ]
                            , a
                                [ Attr.href "#"
                                , Attr.class ""
                                ]
                                [ p
                                    [ Attr.class "w-full py-4 bg-blue-600 mt-8 rounded-xl text-white"
                                    ]
                                    [ span
                                        [ Attr.class "font-medium"
                                        ]
                                        [ text "Choose Plan" ]
                                    , span
                                        [ Attr.class "pl-2 material-icons align-middle text-sm"
                                        ]
                                        [ text "east" ]
                                    ]
                                ]
                            ]
                        , div
                            [ Attr.class "absolute top-4 right-4"
                            ]
                            [ p
                                [ Attr.class "bg-blue-700 font-semibold px-4 py-1 rounded-full uppercase text-xs"
                                ]
                                [ text "Popular" ]
                            ]
                        ]
                    ,                     {- Enterprise Card -}
                    div
                        [ Attr.class "w-96 p-8 bg-white text-center rounded-3xl pl-16 shadow-xl"
                        ]
                        [ h1
                            [ Attr.class "text-black font-semibold text-2xl"
                            ]
                            [ text "Enterprise" ]
                        , p
                            [ Attr.class "pt-2 tracking-wide"
                            ]
                            [ span
                                [ Attr.class "text-gray-400 align-top"
                                ]
                                [ text "$" ]
                            , span
                                [ Attr.class "text-3xl font-semibold"
                                ]
                                [ text "35" ]
                            , span
                                [ Attr.class "text-gray-400 font-medium"
                                ]
                                [ text "/ user" ]
                            ]
                        , hr
                            [ Attr.class "mt-4 border-1"
                            ]
                            []
                        , div
                            [ Attr.class "pt-8"
                            ]
                            [ p
                                [ Attr.class "font-semibold text-gray-400 text-left"
                                ]
                                [ span
                                    [ Attr.class "material-icons align-middle"
                                    ]
                                    [ text "done" ]
                                , span
                                    [ Attr.class "pl-2"
                                    ]
                                    [ text "All features in", span
                                        [ Attr.class "text-black"
                                        ]
                                        [ text "Startup" ]
                                    ]
                                ]
                            , p
                                [ Attr.class "font-semibold text-gray-400 text-left pt-5"
                                ]
                                [ span
                                    [ Attr.class "material-icons align-middle"
                                    ]
                                    [ text "done" ]
                                , span
                                    [ Attr.class "pl-2"
                                    ]
                                    [ text "Growth", span
                                        [ Attr.class "text-black"
                                        ]
                                        [ text "oriented" ]
                                    ]
                                ]
                            , p
                                [ Attr.class "font-semibold text-gray-400 text-left pt-5"
                                ]
                                [ span
                                    [ Attr.class "material-icons align-middle"
                                    ]
                                    [ text "done" ]
                                , span
                                    [ Attr.class "pl-2"
                                    ]
                                    [ span
                                        [ Attr.class "text-black"
                                        ]
                                        [ text "Unlimited" ]
                                    , text "cloud storage" ]
                                ]
                            , a
                                [ Attr.href "#"
                                , Attr.class ""
                                ]
                                [ p
                                    [ Attr.class "w-full py-4 bg-blue-600 mt-8 rounded-xl text-white"
                                    ]
                                    [ span
                                        [ Attr.class "font-medium"
                                        ]
                                        [ text "Choose Plan" ]
                                    , span
                                        [ Attr.class "pl-2 material-icons align-middle text-sm"
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
    
init : () -> ( Model, Cmd Msg )
init _ =
    ( {}, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )
