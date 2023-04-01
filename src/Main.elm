module Main exposing (main)

import Browser exposing (Document, UrlRequest(..))
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (href)
import Json.Encode as E
import Quiz
import Url exposing (Url)
import Url.Parser as UrlParser


type alias Model =
    { key : Nav.Key
    , page : Page
    }


type Route
    = Home
    | Quiz


type Page
    = HomePage
    | QuizPage Quiz.Model


type Msg
    = ClickedLink UrlRequest
    | UrlChanged Url
    | QuizMsg Quiz.Msg


main : Program () Model Msg
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
            ]
        )
        url
        |> Maybe.withDefault Home


routeToPage : Route -> ( Page, Cmd Msg )
routeToPage route =
    case route of
        Home ->
            ( HomePage, Cmd.none )

        Quiz ->
            let
                ( quizModel, cmd ) =
                    Quiz.init E.null
            in
            ( QuizPage quizModel, Cmd.map QuizMsg cmd )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


init : flags -> Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    let
        ( page, cmd ) =
            url |> urlToRoute |> routeToPage
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

        UrlChanged url ->
            let
                ( page, cmd ) =
                    url |> urlToRoute |> routeToPage
            in
            ( { model | page = page }, cmd )

        QuizMsg quizMsg ->
            case model.page of
                HomePage ->
                    ( model, Cmd.none )

                QuizPage quizModel ->
                    let
                        ( newQuizModel, cmd ) =
                            Quiz.update quizMsg quizModel
                    in
                    ( { model | page = QuizPage newQuizModel }, Cmd.map QuizMsg cmd )


view : Model -> Document Msg
view model =
    { title = getPageTitle model.page, body = [ viewPage model.page ] }


viewPage : Page -> Html Msg
viewPage page =
    case page of
        HomePage ->
            div []
                [ h1 [] [ text "Home" ]
                , a [ href "/quiz" ] [ text "Quiz" ]
                ]

        QuizPage quizModel ->
            Quiz.view quizModel |> Html.map QuizMsg


getPageTitle : Page -> String
getPageTitle page =
    case page of
        HomePage ->
            "Home"

        QuizPage _ ->
            "Quiz"
