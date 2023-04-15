module Main exposing (main)

import About exposing (..)
import Add exposing (..)
import Browser exposing (Document, UrlRequest(..))
import Browser.Navigation as Nav
import Evaluate exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class, href)
import Json.Decode exposing (Value)
import Json.Encode as E
import Pricing exposing (..)
import Quizes exposing (Msg, init, update, view)
import Url exposing (Url)
import Url.Parser as UrlParser


type alias Model =
    { key : Nav.Key
    , page : Page
    }


type Route
    = Home
    | Evaluate
    | About
    | Add
    | Quizes
    | Pricing


type Page
    = HomePage
    | EvaluatePage Evaluate.Model
    | AboutPage About.Model
    | AddPage Add.Model
    | QuizesPage Quizes.Model
    | PricingPage Pricing.Model


type Msg
    = ClickedLink UrlRequest
    | UrlChanged Url
    | AboutMsg About.Msg
    | AddMsg Add.Msg
    | EvaluateMsg Evaluate.Msg
    | QuizesMsg Quizes.Msg
    | PricingMsg Pricing.Msg


main : Program Value Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = ClickedLink
        , onUrlChange = UrlChanged
        }


urlToRoute : Url -> Route
urlToRoute url =
    UrlParser.parse
        (UrlParser.oneOf
            [ UrlParser.map Home UrlParser.top
            , UrlParser.map About (UrlParser.s "about")
            , UrlParser.map Add (UrlParser.s "add")
            , UrlParser.map Evaluate (UrlParser.s "evaluate")
            , UrlParser.map Quizes (UrlParser.s "quizes")
            , UrlParser.map Pricing (UrlParser.s "pricing")
            ]
        )
        url
        |> Maybe.withDefault Home


routeToPage : E.Value -> Route -> ( Page, Cmd Msg )
routeToPage flags route =
    case route of
        Home ->
            ( HomePage, Cmd.none )

        About ->
            let
                ( aboutModel, cmd ) =
                    About.init ()
            in
            ( AboutPage aboutModel, Cmd.map AboutMsg cmd )

        Pricing ->
            let
                ( pricingModel, cmd ) =
                    Pricing.init ()
            in
            ( PricingPage pricingModel, Cmd.map PricingMsg cmd )

        Quizes ->
            let
                ( quizesModel, cmd ) =
                    Quizes.init
            in
            ( QuizesPage quizesModel, Cmd.map QuizesMsg cmd )

        Evaluate ->
            let
                ( evaluateModel, cmd ) =
                    Evaluate.init flags
            in
            ( EvaluatePage evaluateModel, Cmd.map EvaluateMsg cmd )

        Add ->
            let
                ( addModel, cmd ) =
                    Add.init flags
            in
            ( AddPage addModel, Cmd.map AddMsg cmd )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


init : E.Value -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        ( page, cmd ) =
            url |> urlToRoute |> routeToPage flags
    in
    ( { key = key, page = page }, cmd )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickedLink urlRequest ->
            case urlRequest of
                Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                External url ->
                    ( model, Nav.load url )

        QuizesMsg quizesMsg ->
            case model.page of
                AboutPage _ ->
                    ( model, Cmd.none )

                EvaluatePage _ ->
                    ( model, Cmd.none )

                PricingPage _ ->
                    ( model, Cmd.none )

                AddPage _ ->
                    ( model, Cmd.none )

                HomePage ->
                    ( model, Cmd.none )

                QuizesPage quizesModel ->
                    let
                        ( newQuizesModel, cmd ) =
                            Quizes.update quizesMsg quizesModel
                    in
                    ( { model | page = QuizesPage newQuizesModel }, Cmd.map QuizesMsg cmd )

        PricingMsg pricingMsg ->
            case model.page of
                AboutPage _ ->
                    ( model, Cmd.none )

                HomePage ->
                    ( model, Cmd.none )

                PricingPage pricingModel ->
                    let
                        ( newPricingModel, cmd ) =
                            Pricing.update pricingMsg pricingModel
                    in
                    ( { model | page = PricingPage newPricingModel }, Cmd.map PricingMsg cmd )

                AddPage _ ->
                    ( model, Cmd.none )

                EvaluatePage _ ->
                    ( model, Cmd.none )

                QuizesPage _ ->
                    ( model, Cmd.none )

        AddMsg addMsg ->
            case model.page of
                AboutPage _ ->
                    ( model, Cmd.none )

                EvaluatePage _ ->
                    ( model, Cmd.none )

                AddPage addModel ->
                    let
                        ( newAddModel, cmd ) =
                            Add.update addMsg addModel
                    in
                    ( { model | page = AddPage newAddModel }, Cmd.map AddMsg cmd )

                HomePage ->
                    ( model, Cmd.none )

                PricingPage _ ->
                    ( model, Cmd.none )

                QuizesPage _ ->
                    ( model, Cmd.none )

        EvaluateMsg evaluateMsg ->
            case model.page of
                EvaluatePage evaluateModel ->
                    let
                        ( newEvaluateModel, cmd ) =
                            Evaluate.update evaluateMsg evaluateModel
                    in
                    ( { model | page = EvaluatePage newEvaluateModel }, Cmd.map EvaluateMsg cmd )

                PricingPage _ ->
                    ( model, Cmd.none )

                AddPage _ ->
                    ( model, Cmd.none )

                AboutPage _ ->
                    ( model, Cmd.none )

                HomePage ->
                    ( model, Cmd.none )

                QuizesPage _ ->
                    ( model, Cmd.none )

        AboutMsg aboutMsg ->
            case model.page of
                AboutPage aboutModel ->
                    let
                        ( newAboutModel, cmd ) =
                            About.update aboutMsg aboutModel
                    in
                    ( { model | page = AboutPage newAboutModel }, Cmd.map AboutMsg cmd )

                AddPage _ ->
                    ( model, Cmd.none )

                EvaluatePage _ ->
                    ( model, Cmd.none )

                HomePage ->
                    ( model, Cmd.none )

                QuizesPage _ ->
                    ( model, Cmd.none )

                PricingPage _ ->
                    ( model, Cmd.none )

        UrlChanged url ->
            let
                ( page, cmd ) =
                    url |> urlToRoute |> routeToPage E.null
            in
            ( { model | page = page }, cmd )


view : Model -> Document Msg
view model =
    { title = getPageTitle model.page, body = [ viewPage model.page ] }


viewPage : Page -> Html Msg
viewPage page =
    case page of
        HomePage ->
            div
                [ class "bg-[#111B27] min-h-screen"
                ]
                [ div
                    [ class "flex text-2xl justify-end font-bold p-3 h-16 text-gray-900  bg-violet-400"
                    ]
                    [ h1
                        [ class "mt-4"
                        ]
                        [ text "Home"
                        ]
                    , a
                        [ href "/about"
                        , class "mt-4 px-10"
                        ]
                        [ text "About"
                        ]
                    , a
                        [ href "/pricing"
                        , class "mt-4 px-10"
                        ]
                        [ text "Pricing"
                        ]
                    ]
                , section [ class "px-6 pt-8 pb-12 sm:pt-20 md:pb-16 lg:pb-0 2xl:pt-28" ]
                    [ div [ class "container flex flex-col justify-center mx-auto lg:flex-row lg:justify-between" ]
                        [ div
                            [ class "flex flex-col justify-center " ]
                            div
                            [ class "flex flex-col justify-center p-6 text-center rounded-sm lg:flex-1 lg:max-w-xl lg:text-left bg-white sm:bg-[#111B27] "
                            ]
                            [ h1
                                [ class "text-5xl font-bold leading-none sm:text-7xl"
                                ]
                                [ text " Kickstart your next"
                                , span
                                    [ class "text-violet-400"
                                    ]
                                    [ text "websites"
                                    ]
                                , span
                                    []
                                    [ text " in minute"
                                    ]
                                ]
                            , p
                                [ class "mt-6 mb-8 text-lg sm:mb-12"
                                ]
                                [ text "Mamba UI is a free, open-source collection of UI components"
                                ]
                            , br
                                [ class "hidden md:inline"
                                ]
                                [ text "and templates based on Tailwind CSS."
                                ]
                            , div
                                [ class "flex-1"
                                ]
                                [ div
                                    [ class "flex gap-24"
                                    ]
                                    [ a
                                        [ href "/quizes"
                                        , class "text-center font-semibold italic text-gray-900 bg-[#A78BFA] h-16 w-full max-w-[250px] text-xl rounded-lg flex items-center justify-center"
                                        ]
                                        [ text "Make Quiz !"
                                        ]
                                    , a
                                        [ href "/evaluate"
                                        , class "text-center font-semibold italic text-gray-900 bg-[#A78BFA] h-16 w-full max-w-[250px] text-xl rounded-lg flex items-center justify-center"
                                        ]
                                        [ text "Get Quiz !"
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]

        AddPage addModel ->
            Add.view addModel |> Html.map AddMsg

        AboutPage aboutModel ->
            About.view aboutModel |> Html.map AboutMsg

        EvaluatePage evaluateModel ->
            Evaluate.view evaluateModel |> Html.map EvaluateMsg

        QuizesPage quizesModel ->
            Quizes.view quizesModel |> Html.map QuizesMsg

        PricingPage pricingModel ->
            Pricing.view pricingModel |> Html.map PricingMsg


getPageTitle : Page -> String
getPageTitle page =
    case page of
        HomePage ->
            "Home"

        AboutPage _ ->
            "About"

        EvaluatePage _ ->
            "Evaluate"

        AddPage _ ->
            "Add"

        QuizesPage _ ->
            "Quizes"

        PricingPage _ ->
            "pricing"
