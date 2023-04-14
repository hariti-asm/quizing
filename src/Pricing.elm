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
                                [ SvgAttr.id "ace59d72-08d5-4850-b9e4-d9d0b86c0525"
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
                            [ SvgAttr.fill "url(#ace59d72-08d5-4850-b9e4-d9d0b86c0525)"
                            , SvgAttr.width "52"
                            , SvgAttr.height "24"
                            ]
                            []
                        ]
                    , span
                        [ Attr.class "relative"
                        ]
                        [ text "Transparent" ]
                    ]
                , text "pricing. Pay as you grow." ]
            , p
                [ Attr.class "text-base text-gray-700 md:text-lg"
                ]
                [ text "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque rem aperiam, eaque ipsa quae." ]
            ]
        , div
            [ Attr.class "grid max-w-md gap-10 row-gap-5 sm:row-gap-10 lg:max-w-screen-md lg:grid-cols-2 sm:mx-auto"
            ]
            [ div
                [ Attr.class "flex flex-col justify-between p-5 bg-white border rounded shadow-sm"
                ]
                [ div
                    [ Attr.class "mb-6"
                    ]
                    [ div
                        [ Attr.class "flex items-center justify-between pb-6 mb-6 border-b"
                        ]
                        [ div []
                            [ p
                                [ Attr.class "text-sm font-bold tracking-wider uppercase"
                                ]
                                [ text "Personal use" ]
                            , p
                                [ Attr.class "text-5xl font-extrabold"
                                ]
                                [ text "Free" ]
                            ]
                        , div
                            [ Attr.class "flex items-center justify-center w-24 h-24 rounded-full bg-blue-gray-50"
                            ]
                            [ svg
                                [ SvgAttr.class "w-10 h-10 text-gray-600"
                                , SvgAttr.viewBox "0 0 24 24"
                                , SvgAttr.strokeLinecap "round"
                                , SvgAttr.strokeWidth "2"
                                ]
                                [ path
                                    [ SvgAttr.d "M12,7L12,7 c-1.657,0-3-1.343-3-3v0c0-1.657,1.343-3,3-3h0c1.657,0,3,1.343,3,3v0C15,5.657,13.657,7,12,7z"
                                    , SvgAttr.fill "none"
                                    , SvgAttr.stroke "currentColor"
                                    ]
                                    []
                                , path
                                    [ SvgAttr.d "M15,23H9v-5H7v-6 c0-1.105,0.895-2,2-2h6c1.105,0,2,0.895,2,2v6h-2V23z"
                                    , SvgAttr.fill "none"
                                    , SvgAttr.stroke "currentColor"
                                    ]
                                    []
                                ]
                            ]
                        ]
                    , div []
                        [ p
                            [ Attr.class "mb-2 font-bold tracking-wide"
                            ]
                            [ text "Features" ]
                        , ul
                            [ Attr.class "space-y-2"
                            ]
                            [ li
                                [ Attr.class "flex items-center"
                                ]
                                [ div
                                    [ Attr.class "mr-2"
                                    ]
                                    [ svg
                                        [ SvgAttr.class "w-4 h-4 text-deep-purple-accent-400"
                                        , SvgAttr.viewBox "0 0 24 24"
                                        , SvgAttr.strokeLinecap "round"
                                        , SvgAttr.strokeWidth "2"
                                        ]
                                        [ Svg.polyline
                                            [ SvgAttr.fill "none"
                                            , SvgAttr.stroke "currentColor"
                                            , SvgAttr.points "6,12 10,16 18,8"
                                            ]
                                            []
                                        , Svg.circle
                                            [ SvgAttr.cx "12"
                                            , SvgAttr.cy "12"
                                            , SvgAttr.fill "none"
                                            , SvgAttr.r "11"
                                            , SvgAttr.stroke "currentColor"
                                            ]
                                            []
                                        ]
                                    ]
                                , p
                                    [ Attr.class "font-medium text-gray-800"
                                    ]
                                    [ text "10 deploys per day" ]
                                ]
                            , li
                                [ Attr.class "flex items-center"
                                ]
                                [ div
                                    [ Attr.class "mr-2"
                                    ]
                                    [ svg
                                        [ SvgAttr.class "w-4 h-4 text-deep-purple-accent-400"
                                        , SvgAttr.viewBox "0 0 24 24"
                                        , SvgAttr.strokeLinecap "round"
                                        , SvgAttr.strokeWidth "2"
                                        ]
                                        [ Svg.polyline
                                            [ SvgAttr.fill "none"
                                            , SvgAttr.stroke "currentColor"
                                            , SvgAttr.points "6,12 10,16 18,8"
                                            ]
                                            []
                                        , Svg.circle
                                            [ SvgAttr.cx "12"
                                            , SvgAttr.cy "12"
                                            , SvgAttr.fill "none"
                                            , SvgAttr.r "11"
                                            , SvgAttr.stroke "currentColor"
                                            ]
                                            []
                                        ]
                                    ]
                                , p
                                    [ Attr.class "font-medium text-gray-800"
                                    ]
                                    [ text "10 GB of storage" ]
                                ]
                            , li
                                [ Attr.class "flex items-center"
                                ]
                                [ div
                                    [ Attr.class "mr-2"
                                    ]
                                    [ svg
                                        [ SvgAttr.class "w-4 h-4 text-deep-purple-accent-400"
                                        , SvgAttr.viewBox "0 0 24 24"
                                        , SvgAttr.strokeLinecap "round"
                                        , SvgAttr.strokeWidth "2"
                                        ]
                                        [ Svg.polyline
                                            [ SvgAttr.fill "none"
                                            , SvgAttr.stroke "currentColor"
                                            , SvgAttr.points "6,12 10,16 18,8"
                                            ]
                                            []
                                        , Svg.circle
                                            [ SvgAttr.cx "12"
                                            , SvgAttr.cy "12"
                                            , SvgAttr.fill "none"
                                            , SvgAttr.r "11"
                                            , SvgAttr.stroke "currentColor"
                                            ]
                                            []
                                        ]
                                    ]
                                , p
                                    [ Attr.class "font-medium text-gray-800"
                                    ]
                                    [ text "Unlimited domains" ]
                                ]
                            , li
                                [ Attr.class "flex items-center"
                                ]
                                [ div
                                    [ Attr.class "mr-2"
                                    ]
                                    [ svg
                                        [ SvgAttr.class "w-4 h-4 text-deep-purple-accent-400"
                                        , SvgAttr.viewBox "0 0 24 24"
                                        , SvgAttr.strokeLinecap "round"
                                        , SvgAttr.strokeWidth "2"
                                        ]
                                        [ Svg.polyline
                                            [ SvgAttr.fill "none"
                                            , SvgAttr.stroke "currentColor"
                                            , SvgAttr.points "6,12 10,16 18,8"
                                            ]
                                            []
                                        , Svg.circle
                                            [ SvgAttr.cx "12"
                                            , SvgAttr.cy "12"
                                            , SvgAttr.fill "none"
                                            , SvgAttr.r "11"
                                            , SvgAttr.stroke "currentColor"
                                            ]
                                            []
                                        ]
                                    ]
                                , p
                                    [ Attr.class "font-medium text-gray-800"
                                    ]
                                    [ text "SSL Certificates" ]
                                ]
                            ]
                        ]
                    ]
                , div []
                    [ a
                        [ Attr.href "/"
                        , Attr.class "inline-flex items-center justify-center w-full h-12 px-6 mb-4 font-medium tracking-wide text-white transition duration-200 bg-gray-800 rounded shadow-md hover:bg-gray-900 focus:shadow-outline focus:outline-none"
                        ]
                        [ text "Start for free" ]
                    , p
                        [ Attr.class "text-sm text-gray-600"
                        ]
                        [ text "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium" ]
                    ]
                ]
            , div
                [ Attr.class "flex flex-col justify-between p-5 bg-white border rounded shadow-sm"
                ]
                [ div
                    [ Attr.class "mb-6"
                    ]
                    [ div
                        [ Attr.class "flex items-center justify-between pb-6 mb-6 border-b"
                        ]
                        [ div []
                            [ p
                                [ Attr.class "text-sm font-bold tracking-wider uppercase"
                                ]
                                [ text "For your team" ]
                            , p
                                [ Attr.class "text-5xl font-extrabold"
                                ]
                                [ text "$39" ]
                            ]
                        , div
                            [ Attr.class "flex items-center justify-center w-24 h-24 rounded-full bg-indigo-50"
                            ]
                            [ svg
                                [ SvgAttr.class "w-10 h-10 text-deep-purple-accent-400"
                                , SvgAttr.viewBox "0 0 24 24"
                                , SvgAttr.strokeLinecap "round"
                                , SvgAttr.strokeWidth "2"
                                ]
                                [ path
                                    [ SvgAttr.d "M4,7L4,7 C2.895,7,2,6.105,2,5v0c0-1.105,0.895-2,2-2h0c1.105,0,2,0.895,2,2v0C6,6.105,5.105,7,4,7z"
                                    , SvgAttr.fill "none"
                                    , SvgAttr.stroke "currentColor"
                                    ]
                                    []
                                , path
                                    [ SvgAttr.d "M6,21H3v-4 l-2,0v-5c0-1.105,0.895-2,2-2h1"
                                    , SvgAttr.fill "none"
                                    , SvgAttr.stroke "currentColor"
                                    ]
                                    []
                                , path
                                    [ SvgAttr.d "M20,7L20,7 c1.105,0,2-0.895,2-2v0c0-1.105-0.895-2-2-2h0c-1.105,0-2,0.895-2,2v0C18,6.105,18.895,7,20,7z"
                                    , SvgAttr.fill "none"
                                    , SvgAttr.stroke "currentColor"
                                    ]
                                    []
                                , path
                                    [ SvgAttr.d "M18,21h3v-4 l2,0v-5c0-1.105-0.895-2-2-2h-1"
                                    , SvgAttr.fill "none"
                                    , SvgAttr.stroke "currentColor"
                                    ]
                                    []
                                , path
                                    [ SvgAttr.d "M12,7L12,7 c-1.657,0-3-1.343-3-3v0c0-1.657,1.343-3,3-3h0c1.657,0,3,1.343,3,3v0C15,5.657,13.657,7,12,7z"
                                    , SvgAttr.fill "none"
                                    , SvgAttr.stroke "currentColor"
                                    ]
                                    []
                                , path
                                    [ SvgAttr.d "M15,23H9v-6H7v-5 c0-1.105,0.895-2,2-2h6c1.105,0,2,0.895,2,2v6h-2V23z"
                                    , SvgAttr.fill "none"
                                    , SvgAttr.stroke "currentColor"
                                    ]
                                    []
                                ]
                            ]
                        ]
                    , div []
                        [ p
                            [ Attr.class "mb-2 font-bold tracking-wide"
                            ]
                            [ text "Features" ]
                        , ul
                            [ Attr.class "space-y-2"
                            ]
                            [ li
                                [ Attr.class "flex items-center"
                                ]
                                [ div
                                    [ Attr.class "mr-2"
                                    ]
                                    [ svg
                                        [ SvgAttr.class "w-4 h-4 text-deep-purple-accent-400"
                                        , SvgAttr.viewBox "0 0 24 24"
                                        , SvgAttr.strokeLinecap "round"
                                        , SvgAttr.strokeWidth "2"
                                        ]
                                        [ Svg.polyline
                                            [ SvgAttr.fill "none"
                                            , SvgAttr.stroke "currentColor"
                                            , SvgAttr.points "6,12 10,16 18,8"
                                            ]
                                            []
                                        , Svg.circle
                                            [ SvgAttr.cx "12"
                                            , SvgAttr.cy "12"
                                            , SvgAttr.fill "none"
                                            , SvgAttr.r "11"
                                            , SvgAttr.stroke "currentColor"
                                            ]
                                            []
                                        ]
                                    ]
                                , p
                                    [ Attr.class "font-medium text-gray-800"
                                    ]
                                    [ text "Unlimited deploys" ]
                                ]
                            , li
                                [ Attr.class "flex items-center"
                                ]
                                [ div
                                    [ Attr.class "mr-2"
                                    ]
                                    [ svg
                                        [ SvgAttr.class "w-4 h-4 text-deep-purple-accent-400"
                                        , SvgAttr.viewBox "0 0 24 24"
                                        , SvgAttr.strokeLinecap "round"
                                        , SvgAttr.strokeWidth "2"
                                        ]
                                        [ Svg.polyline
                                            [ SvgAttr.fill "none"
                                            , SvgAttr.stroke "currentColor"
                                            , SvgAttr.points "6,12 10,16 18,8"
                                            ]
                                            []
                                        , Svg.circle
                                            [ SvgAttr.cx "12"
                                            , SvgAttr.cy "12"
                                            , SvgAttr.fill "none"
                                            , SvgAttr.r "11"
                                            , SvgAttr.stroke "currentColor"
                                            ]
                                            []
                                        ]
                                    ]
                                , p
                                    [ Attr.class "font-medium text-gray-800"
                                    ]
                                    [ text "Up to 10 Team Members" ]
                                ]
                            , li
                                [ Attr.class "flex items-center"
                                ]
                                [ div
                                    [ Attr.class "mr-2"
                                    ]
                                    [ svg
                                        [ SvgAttr.class "w-4 h-4 text-deep-purple-accent-400"
                                        , SvgAttr.viewBox "0 0 24 24"
                                        , SvgAttr.strokeLinecap "round"
                                        , SvgAttr.strokeWidth "2"
                                        ]
                                        [ Svg.polyline
                                            [ SvgAttr.fill "none"
                                            , SvgAttr.stroke "currentColor"
                                            , SvgAttr.points "6,12 10,16 18,8"
                                            ]
                                            []
                                        , Svg.circle
                                            [ SvgAttr.cx "12"
                                            , SvgAttr.cy "12"
                                            , SvgAttr.fill "none"
                                            , SvgAttr.r "11"
                                            , SvgAttr.stroke "currentColor"
                                            ]
                                            []
                                        ]
                                    ]
                                , p
                                    [ Attr.class "font-medium text-gray-800"
                                    ]
                                    [ text "100 GB of starge" ]
                                ]
                            , li
                                [ Attr.class "flex items-center"
                                ]
                                [ div
                                    [ Attr.class "mr-2"
                                    ]
                                    [ svg
                                        [ SvgAttr.class "w-4 h-4 text-deep-purple-accent-400"
                                        , SvgAttr.viewBox "0 0 24 24"
                                        , SvgAttr.strokeLinecap "round"
                                        , SvgAttr.strokeWidth "2"
                                        ]
                                        [ Svg.polyline
                                            [ SvgAttr.fill "none"
                                            , SvgAttr.stroke "currentColor"
                                            , SvgAttr.points "6,12 10,16 18,8"
                                            ]
                                            []
                                        , Svg.circle
                                            [ SvgAttr.cx "12"
                                            , SvgAttr.cy "12"
                                            , SvgAttr.fill "none"
                                            , SvgAttr.r "11"
                                            , SvgAttr.stroke "currentColor"
                                            ]
                                            []
                                        ]
                                    ]
                                , p
                                    [ Attr.class "font-medium text-gray-800"
                                    ]
                                    [ text "24/7 support" ]
                                ]
                            , li
                                [ Attr.class "flex items-center"
                                ]
                                [ div
                                    [ Attr.class "mr-2"
                                    ]
                                    [ svg
                                        [ SvgAttr.class "w-4 h-4 text-deep-purple-accent-400"
                                        , SvgAttr.viewBox "0 0 24 24"
                                        , SvgAttr.strokeLinecap "round"
                                        , SvgAttr.strokeWidth "2"
                                        ]
                                        [ Svg.polyline
                                            [ SvgAttr.fill "none"
                                            , SvgAttr.stroke "currentColor"
                                            , SvgAttr.points "6,12 10,16 18,8"
                                            ]
                                            []
                                        , Svg.circle
                                            [ SvgAttr.cx "12"
                                            , SvgAttr.cy "12"
                                            , SvgAttr.fill "none"
                                            , SvgAttr.r "11"
                                            , SvgAttr.stroke "currentColor"
                                            ]
                                            []
                                        ]
                                    ]
                                , p
                                    [ Attr.class "font-medium text-gray-800"
                                    ]
                                    [ text "Global CDN" ]
                                ]
                            ]
                        ]
                    ]
                , div []
                    [ a
                        [ Attr.href "/"
                        , Attr.class "inline-flex items-center justify-center w-full h-12 px-6 mb-4 font-medium tracking-wide text-white transition duration-200 rounded shadow-md bg-deep-purple-accent-400 hover:bg-deep-purple-accent-700 focus:shadow-outline focus:outline-none"
                        ]
                        [ text "Get started" ]
                    , p
                        [ Attr.class "text-sm text-gray-600"
                        ]
                        [ text "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium" ]
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
