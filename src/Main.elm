module Main exposing (main)

import About
import Browser exposing (Document, UrlRequest(..))
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (class, href)
import Json.Decode exposing (Value)
import Json.Encode as E
import Quiz exposing (..)
import Url exposing (Url)
import Url.Parser as UrlParser


type alias Model =
    { key : Nav.Key
    , page : Page
    }


type Route
    = Home
    | Quiz
    | About


type Page
    = HomePage
    | QuizPage Quiz.Model
    | AboutPage About.Model


type Msg
    = ClickedLink UrlRequest
    | UrlChanged Url
    | QuizMsg Quiz.Msg
    | AboutMsg About.Msg


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
            , UrlParser.map Quiz (UrlParser.s "quiz")
            , UrlParser.map About (UrlParser.s "about")
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

        Quiz ->
            let
                ( quizModel, cmd ) =
                    Quiz.init flags
            in
            ( QuizPage quizModel, Cmd.map QuizMsg cmd )


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

        QuizMsg quizMsg ->
            case model.page of
                AboutPage aboutmodel ->
                    ( model, Cmd.none )

                HomePage ->
                    ( model, Cmd.none )

                QuizPage quizModel ->
                    let
                        ( newQuizModel, cmd ) =
                            Quiz.update quizMsg quizModel
                    in
                    ( { model | page = QuizPage newQuizModel }, Cmd.map QuizMsg cmd )

        AboutMsg aboutMsg ->
            case model.page of
                AboutPage aboutModel ->
                    let
                        ( newAboutModel, cmd ) =
                            About.update aboutMsg aboutModel
                    in
                    ( { model | page = AboutPage newAboutModel }, Cmd.map AboutMsg cmd )

                QuizPage _ ->
                    ( model, Cmd.none )

                HomePage ->
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
            div [ class "flex  gap-24  text-xl italic  bg-[#8419FF]  h-16 text-[#FFFFFF]" ]
                [ h1 [ class "  mt-4 ml-[500px]" ] [ text "Home" ]
                , a [ href "/quiz", class "mt-4 " ] [ text "Quiz" ]
                , a [ href "/about", class "mt-4 " ] [ text "About" ]
                ]

        AboutPage aboutModel ->
            About.view aboutModel |> Html.map AboutMsg

        QuizPage quizModel ->
            Quiz.view quizModel |> Html.map QuizMsg


getPageTitle : Page -> String
getPageTitle page =
    case page of
        HomePage ->
            "Home"

        AboutPage _ ->
            "About"

        QuizPage _ ->
            "Quiz"
