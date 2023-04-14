module Pricing exposing (..)

import Html exposing (Html, a, div, h2, img, p, span, text)
import Html.Attributes exposing (alt, class, href, src)


type alias Model =
    {}


type Msg
    = NoOp


view : Model -> Html Msg
view model =
    div
        [ class "px-4 py-16 mx-auto sm:max-w-xl md:max-w-full lg:max-w-screen-xl md:px-24 lg:px-8 lg:py-20"
        ]
        [ div
            [ class "max-w-xl mb-10 md:mx-auto sm:text-center lg:max-w-2xl md:mb-12"
            ]
            [ div []
                [ p
                    [ class "inline-block px-3 py-px mb-4 text-xs font-semibold tracking-wider text-teal-900 uppercase rounded-full bg-teal-accent-400"
                    ]
                    [ text "Brand new" ]
                ]
            , h2
                [ class "max-w-lg mb-6 font-sans text-3xl font-bold leading-none tracking-tight text-gray-900 sm:text-4xl md:mx-auto"
                ]
                [ span
                    [ class "relative inline-block"
                    ]
                    [ span
                        [ class "relative"
                        ]
                        [ text "Choose" ]
                    ]
                , text "your way. Advance everyday."
                ]
            , p
                [ class "text-base text-gray-700 md:text-lg"
                ]
                [ text "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque rem aperiam, eaque ipsa quae." ]
            ]
        , div
            [ class "grid max-w-md gap-10 row-gap-8 lg:max-w-screen-lg sm:row-gap-10 lg:grid-cols-3 xl:max-w-screen-lg sm:mx-auto"
            ]
            [ div
                [ class "flex flex-col transition duration-300 bg-white rounded shadow-sm hover:shadow"
                ]
                [ div
                    [ class "relative w-full h-48"
                    ]
                    [ img
                        [ src "https://images.pexels.com/photos/3184305/pexels-photo-3184305.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
                        , class "object-cover w-full h-full rounded-t"
                        , alt "Plan"
                        ]
                        []
                    ]
                , div
                    [ class "flex flex-col justify-between flex-grow p-8 border border-t-0 rounded-b"
                    ]
                    [ div []
                        [ div
                            [ class "text-lg font-semibold"
                            ]
                            [ text "Basic" ]
                        , p
                            [ class "text-sm text-gray-900"
                            ]
                            [ text "Sed ut perspiciatis unde omnis iste natus error sit voluptatem doloremque." ]
                        , div
                            [ class "mt-1 mb-4 mr-1 text-4xl font-bold sm:text-5xl"
                            ]
                            [ text "$12" ]
                        ]
                    , a
                        [ href "/"
                        , class "inline-flex items-center justify-center w-full h-12 px-6 font-medium tracking-wide text-white transition duration-200 rounded shadow-md bg-deep-purple-accent-400 hover:bg-deep-purple-accent-700 focus:shadow-outline focus:outline-none"
                        ]
                        [ text "Buy Basic" ]
                    ]
                ]
            , div
                [ class "flex flex-col transition duration-300 bg-white rounded shadow-sm hover:shadow"
                ]
                [ div
                    [ class "relative w-full h-48"
                    ]
                    [ img
                        [ src "https://images.pexels.com/photos/3183181/pexels-photo-3183181.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
                        , class "object-cover w-full h-full rounded-t"
                        , alt "Plan"
                        ]
                        []
                    ]
                , div
                    [ class "flex flex-col justify-between flex-grow p-8 border border-t-0 rounded-b"
                    ]
                    [ div []
                        [ div
                            [ class "text-lg font-semibold"
                            ]
                            [ text "Advanced" ]
                        , p
                            [ class "text-sm text-gray-900"
                            ]
                            [ text "A flower in my garden, a mystery in my panties. Heart attack never was so close." ]
                        , div
                            [ class "mt-1 mb-4 mr-1 text-4xl font-bold sm:text-5xl"
                            ]
                            [ text "$38" ]
                        ]
                    , a
                        [ href "/"
                        , class "inline-flex items-center justify-center w-full h-12 px-6 font-medium tracking-wide text-white transition duration-200 rounded shadow-md bg-deep-purple-accent-400 hover:bg-deep-purple-accent-700 focus:shadow-outline focus:outline-none"
                        ]
                        [ text "Buy Advanced" ]
                    ]
                ]
            , div
                [ class "flex flex-col transition duration-300 bg-white rounded shadow-sm hover:shadow"
                ]
                [ div
                    [ class "relative w-full h-48"
                    ]
                    [ img
                        [ src "https://images.pexels.com/photos/3182743/pexels-photo-3182743.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
                        , class "object-cover w-full h-full rounded-t"
                        , alt "Plan"
                        ]
                        []
                    ]
                , div
                    [ class "flex flex-col justify-between flex-grow p-8 border border-t-0 rounded-b"
                    ]
                    [ div []
                        [ div
                            [ class "text-lg font-semibold"
                            ]
                            [ text "Pro" ]
                        , p
                            [ class "text-sm text-gray-900"
                            ]
                            [ text "We never had the chance to. Maybe it was the eleven months he spent in the womb." ]
                        , div
                            [ class "mt-1 mb-4 mr-1 text-4xl font-bold sm:text-5xl"
                            ]
                            [ text "$78" ]
                        ]
                    , a
                        [ href "/"
                        , class "inline-flex items-center justify-center w-full h-12 px-6 font-medium tracking-wide text-white transition duration-200 rounded shadow-md bg-deep-purple-accent-400 hover:bg-deep-purple-accent-700 focus:shadow-outline focus:outline-none"
                        ]
                        [ text "Buy Pro" ]
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
