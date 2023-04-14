module Pricing exposing (..)



type alias Model =
    {}


type Msg
    = NoOp


view : Model -> Html Msg
view model =
       div
        [ Attr.class "px-4 py-16 mx-auto sm:max-w-xl md:max-w-full lg:max-w-screen-xl md:px-24 lg:px-8 lg:py-20"
        ]
        [ div
            [ Attr.class "max-w-xl mb-10 md:mx-auto sm:text-center lg:max-w-2xl md:mb-12"
            ]
            [ div []
                [ p
                    [ Attr.class "inline-block px-3 py-px mb-4 text-xs font-semibold tracking-wider text-teal-900 uppercase rounded-full bg-teal-accent-400"
                    ]
                    [ text "Brand new" ]
                ]
            , h2
                [ Attr.class "max-w-lg mb-6 font-sans text-3xl font-bold leading-none tracking-tight text-gray-900 sm:text-4xl md:mx-auto"
                ]
                [ span
                    [ Attr.class "relative inline-block"
                    ]
                    [ svg
                        [ SvgAttr.viewBox "0 0 52 24"
                        , SvgAttr.fill "currentColor"
                        , SvgAttr.class "absolute top-0 left-0 z-0 hidden w-32 -mt-8 -ml-20 text-blue-gray-100 lg:w-32 lg:-ml-28 lg:-mt-10 sm:block"
                        ]
                        [ Svg.defs []
                            [ Svg.pattern
                                [ SvgAttr.id "bc9273ce-29bb-4565-959b-714607d4d027"
                                , SvgAttr.x "0"
                                , SvgAttr.y "0"
                                , SvgAttr.width ".135"
                                , SvgAttr.height ".30"
                                ]
                                [ Svg.circle
                                    [ SvgAttr.cx "1"
                                    , SvgAttr.cy "1"
                                    , SvgAttr.r ".7"
                                    ]
                                    []
                                ]
                            ]
                        , Svg.rect
                            [ SvgAttr.fill "url(#bc9273ce-29bb-4565-959b-714607d4d027)"
                            , SvgAttr.width "52"
                            , SvgAttr.height "24"
                            ]
                            []
                        ]
                    , span
                        [ Attr.class "relative"
                        ]
                        [ text "Choose" ]
                    ]
                , text "your way. Advance everyday." ]
            , p
                [ Attr.class "text-base text-gray-700 md:text-lg"
                ]
                [ text "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque rem aperiam, eaque ipsa quae." ]
            ]
        , div
            [ Attr.class "grid max-w-md gap-10 row-gap-8 lg:max-w-screen-lg sm:row-gap-10 lg:grid-cols-3 xl:max-w-screen-lg sm:mx-auto"
            ]
            [ div
                [ Attr.class "flex flex-col transition duration-300 bg-white rounded shadow-sm hover:shadow"
                ]
                [ div
                    [ Attr.class "relative w-full h-48"
                    ]
                    [ img
                        [ Attr.src "https://images.pexels.com/photos/3184305/pexels-photo-3184305.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
                        , Attr.class "object-cover w-full h-full rounded-t"
                        , Attr.alt "Plan"
                        ]
                        []
                    ]
                , div
                    [ Attr.class "flex flex-col justify-between flex-grow p-8 border border-t-0 rounded-b"
                    ]
                    [ div []
                        [ div
                            [ Attr.class "text-lg font-semibold"
                            ]
                            [ text "Basic" ]
                        , p
                            [ Attr.class "text-sm text-gray-900"
                            ]
                            [ text "Sed ut perspiciatis unde omnis iste natus error sit voluptatem doloremque." ]
                        , div
                            [ Attr.class "mt-1 mb-4 mr-1 text-4xl font-bold sm:text-5xl"
                            ]
                            [ text "$12" ]
                        ]
                    , a
                        [ Attr.href "/"
                        , Attr.class "inline-flex items-center justify-center w-full h-12 px-6 font-medium tracking-wide text-white transition duration-200 rounded shadow-md bg-deep-purple-accent-400 hover:bg-deep-purple-accent-700 focus:shadow-outline focus:outline-none"
                        ]
                        [ text "Buy Basic" ]
                    ]
                ]
            , div
                [ Attr.class "flex flex-col transition duration-300 bg-white rounded shadow-sm hover:shadow"
                ]
                [ div
                    [ Attr.class "relative w-full h-48"
                    ]
                    [ img
                        [ Attr.src "https://images.pexels.com/photos/3183181/pexels-photo-3183181.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
                        , Attr.class "object-cover w-full h-full rounded-t"
                        , Attr.alt "Plan"
                        ]
                        []
                    ]
                , div
                    [ Attr.class "flex flex-col justify-between flex-grow p-8 border border-t-0 rounded-b"
                    ]
                    [ div []
                        [ div
                            [ Attr.class "text-lg font-semibold"
                            ]
                            [ text "Advanced" ]
                        , p
                            [ Attr.class "text-sm text-gray-900"
                            ]
                            [ text "A flower in my garden, a mystery in my panties. Heart attack never was so close." ]
                        , div
                            [ Attr.class "mt-1 mb-4 mr-1 text-4xl font-bold sm:text-5xl"
                            ]
                            [ text "$38" ]
                        ]
                    , a
                        [ Attr.href "/"
                        , Attr.class "inline-flex items-center justify-center w-full h-12 px-6 font-medium tracking-wide text-white transition duration-200 rounded shadow-md bg-deep-purple-accent-400 hover:bg-deep-purple-accent-700 focus:shadow-outline focus:outline-none"
                        ]
                        [ text "Buy Advanced" ]
                    ]
                ]
            , div
                [ Attr.class "flex flex-col transition duration-300 bg-white rounded shadow-sm hover:shadow"
                ]
                [ div
                    [ Attr.class "relative w-full h-48"
                    ]
                    [ img
                        [ Attr.src "https://images.pexels.com/photos/3182743/pexels-photo-3182743.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
                        , Attr.class "object-cover w-full h-full rounded-t"
                        , Attr.alt "Plan"
                        ]
                        []
                    ]
                , div
                    [ Attr.class "flex flex-col justify-between flex-grow p-8 border border-t-0 rounded-b"
                    ]
                    [ div []
                        [ div
                            [ Attr.class "text-lg font-semibold"
                            ]
                            [ text "Pro" ]
                        , p
                            [ Attr.class "text-sm text-gray-900"
                            ]
                            [ text "We never had the chance to. Maybe it was the eleven months he spent in the womb." ]
                        , div
                            [ Attr.class "mt-1 mb-4 mr-1 text-4xl font-bold sm:text-5xl"
                            ]
                            [ text "$78" ]
                        ]
                    , a
                        [ Attr.href "/"
                        , Attr.class "inline-flex items-center justify-center w-full h-12 px-6 font-medium tracking-wide text-white transition duration-200 rounded shadow-md bg-deep-purple-accent-400 hover:bg-deep-purple-accent-700 focus:shadow-outline focus:outline-none"
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
