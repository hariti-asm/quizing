module Pricing exposing (..)

import Html exposing (Html, a, br, div, h1, h2, hr, img, node, p, span, text)
import Html.Attributes exposing (alt, class, href, rel, src)


type alias Model =
    {}


type Msg
    = NoOp


view : Model -> Html Msg
view model =
      section
        [ Attr.class "py-20 dark:bg-gray-800 dark:text-gray-100"
        ]
        [ div
            [ Attr.class "container px-4 mx-auto"
            ]
            [ div
                [ Attr.class "max-w-2xl mx-auto mb-16 text-center"
                ]
                [ span
                    [ Attr.class "font-bold tracking-wider uppercase dark:text-violet-400"
                    ]
                    [ text "Pricing" ]
                , h2
                    [ Attr.class "text-4xl font-bold lg:text-5xl"
                    ]
                    [ text "Choose your best plan" ]
                ]
            , div
                [ Attr.class "flex flex-wrap items-stretch -mx-4"
                ]
                [ div
                    [ Attr.class "flex w-full mb-8 sm:px-4 md:w-1/2 lg:w-1/3 lg:mb-0"
                    ]
                    [ div
                        [ Attr.class "flex flex-col p-6 space-y-6 rounded shadow sm:p-8 dark:bg-gray-900"
                        ]
                        [ div
                            [ Attr.class "space-y-2"
                            ]
                            [ h4
                                [ Attr.class "text-2xl font-bold"
                                ]
                                [ text "Beginner" ]
                            , span
                                [ Attr.class "text-6xl font-bold"
                                ]
                                [ text "Free" ]
                            ]
                        , p
                            [ Attr.class "mt-3 leading-relaxed dark:text-gray-400"
                            ]
                            [ text "Etiam ac convallis enim, eget euismod dolor." ]
                        , ul
                            [ Attr.class "flex-1 mb-6 dark:text-gray-400"
                            ]
                            [ li
                                [ Attr.class "flex mb-2 space-x-2"
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.fill "currentColor"
                                    , SvgAttr.class "flex-shrink-0 w-6 h-6 dark:text-violet-400"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.d "M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                        , SvgAttr.clipRule "evenodd"
                                        ]
                                        []
                                    ]
                                , span []
                                    [ text "Aenean quis" ]
                                ]
                            , li
                                [ Attr.class "flex mb-2 space-x-2"
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.fill "currentColor"
                                    , SvgAttr.class "flex-shrink-0 w-6 h-6 dark:text-violet-400"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.d "M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                        , SvgAttr.clipRule "evenodd"
                                        ]
                                        []
                                    ]
                                , span []
                                    [ text "Morbi semper" ]
                                ]
                            , li
                                [ Attr.class "flex mb-2 space-x-2"
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.fill "currentColor"
                                    , SvgAttr.class "flex-shrink-0 w-6 h-6 dark:text-violet-400"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.d "M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                        , SvgAttr.clipRule "evenodd"
                                        ]
                                        []
                                    ]
                                , span []
                                    [ text "Tristique enim nec" ]
                                ]
                            ]
                        , button
                            [ Attr.type_ "button"
                            , Attr.class "inline-block px-5 py-3 font-semibold tracking-wider text-center rounded dark:bg-violet-400 dark:text-gray-900"
                            ]
                            [ text "Get Started" ]
                        ]
                    ]
                , div
                    [ Attr.class "flex w-full mb-8 sm:px-4 md:w-1/2 lg:w-1/3 lg:mb-0"
                    ]
                    [ div
                        [ Attr.class "flex flex-col p-6 space-y-6 rounded shadow sm:p-8 dark:bg-violet-400 dark:text-gray-900"
                        ]
                        [ div
                            [ Attr.class "space-y-2"
                            ]
                            [ h4
                                [ Attr.class "text-2xl font-bold"
                                ]
                                [ text "Pro" ]
                            , span
                                [ Attr.class "text-6xl font-bold"
                                ]
                                [ text "$24", span
                                    [ Attr.class "text-sm tracking-wide"
                                    ]
                                    [ text "/month" ]
                                ]
                            ]
                        , p
                            [ Attr.class "leading-relaxed"
                            ]
                            [ text "Morbi cursus ut sapien sit amet consectetur." ]
                        , ul
                            [ Attr.class "flex-1 space-y-2"
                            ]
                            [ li
                                [ Attr.class "flex items-center space-x-2"
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.fill "currentColor"
                                    , SvgAttr.class "flex-shrink-0 w-6 h-6"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.d "M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                        , SvgAttr.clipRule "evenodd"
                                        ]
                                        []
                                    ]
                                , span []
                                    [ text "Everything in Free" ]
                                ]
                            , li
                                [ Attr.class "flex items-center space-x-2"
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.fill "currentColor"
                                    , SvgAttr.class "flex-shrink-0 w-6 h-6"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.d "M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                        , SvgAttr.clipRule "evenodd"
                                        ]
                                        []
                                    ]
                                , span []
                                    [ text "Phasellus tellus" ]
                                ]
                            , li
                                [ Attr.class "flex items-center space-x-2"
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.fill "currentColor"
                                    , SvgAttr.class "flex-shrink-0 w-6 h-6"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.d "M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                        , SvgAttr.clipRule "evenodd"
                                        ]
                                        []
                                    ]
                                , span []
                                    [ text "Praesent faucibus" ]
                                ]
                            , li
                                [ Attr.class "flex items-center space-x-2"
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.fill "currentColor"
                                    , SvgAttr.class "flex-shrink-0 w-6 h-6"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.d "M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                        , SvgAttr.clipRule "evenodd"
                                        ]
                                        []
                                    ]
                                , span []
                                    [ text "Aenean et lectus blandit" ]
                                ]
                            ]
                        , a
                            [ Attr.rel "noopener noreferrer"
                            , Attr.href "#"
                            , Attr.class "inline-block w-full px-5 py-3 font-bold tracking-wider text-center rounded dark:bg-gray-800 dark:text-violet-400"
                            ]
                            [ text "Get Started" ]
                        ]
                    ]
                , div
                    [ Attr.class "w-full mb-8 sm:px-4 md:w-1/2 lg:w-1/3 lg:mb-0"
                    ]
                    [ div
                        [ Attr.class "p-6 space-y-6 rounded shadow sm:p-8 dark:bg-gray-900"
                        ]
                        [ div
                            [ Attr.class "space-y-2"
                            ]
                            [ h4
                                [ Attr.class "text-2xl font-bold"
                                ]
                                [ text "Team" ]
                            , span
                                [ Attr.class "text-6xl font-bold"
                                ]
                                [ text "$72", span
                                    [ Attr.class "text-sm tracking-wide"
                                    ]
                                    [ text "/month" ]
                                ]
                            ]
                        , p
                            [ Attr.class "leading-relaxed dark:text-gray-400"
                            ]
                            [ text "Phasellus ultrices bibendum nibh in vehicula." ]
                        , ul
                            [ Attr.class "space-y-2 dark:text-gray-400"
                            ]
                            [ li
                                [ Attr.class "flex items-start space-x-2"
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.fill "currentColor"
                                    , SvgAttr.class "flex-shrink-0 w-6 h-6 dark:text-violet-400"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.d "M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                        , SvgAttr.clipRule "evenodd"
                                        ]
                                        []
                                    ]
                                , span []
                                    [ text "Everything in Pro" ]
                                ]
                            , li
                                [ Attr.class "flex items-start space-x-2"
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.fill "currentColor"
                                    , SvgAttr.class "flex-shrink-0 w-6 h-6 dark:text-violet-400"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.d "M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                        , SvgAttr.clipRule "evenodd"
                                        ]
                                        []
                                    ]
                                , span []
                                    [ text "Fusce sem ligula" ]
                                ]
                            , li
                                [ Attr.class "flex items-start space-x-2"
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.fill "currentColor"
                                    , SvgAttr.class "flex-shrink-0 w-6 h-6 dark:text-violet-400"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.d "M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                        , SvgAttr.clipRule "evenodd"
                                        ]
                                        []
                                    ]
                                , span []
                                    [ text "Curabitur dictum" ]
                                ]
                            , li
                                [ Attr.class "flex items-start space-x-2"
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.fill "currentColor"
                                    , SvgAttr.class "flex-shrink-0 w-6 h-6 dark:text-violet-400"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.d "M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                        , SvgAttr.clipRule "evenodd"
                                        ]
                                        []
                                    ]
                                , span []
                                    [ text "Duis odio eros" ]
                                ]
                            , li
                                [ Attr.class "flex items-start space-x-2"
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.fill "currentColor"
                                    , SvgAttr.class "flex-shrink-0 w-6 h-6 dark:text-violet-400"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.d "M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                        , SvgAttr.clipRule "evenodd"
                                        ]
                                        []
                                    ]
                                , span []
                                    [ text "Vivamus ut lectus ex" ]
                                ]
                            ]
                        , a
                            [ Attr.rel "noopener noreferrer"
                            , Attr.href "#"
                            , Attr.class "inline-block w-full px-5 py-3 font-semibold tracking-wider text-center rounded dark:bg-violet-400 dark:text-gray-900"
                            ]
                            [ text "Get Started" ]
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
