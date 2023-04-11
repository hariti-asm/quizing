module Main exposing (main)

import About
import Add exposing (..)
import Browser exposing (Document, UrlRequest(..))
import Browser.Navigation as Nav
import Evaluate exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class, href)
import Json.Decode exposing (Value)
import Json.Encode as E
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


type Page
    = HomePage
    | EvaluatePage Evaluate.Model
    | AboutPage About.Model
    | AddPage Add.Model


type Msg
    = ClickedLink UrlRequest
    | UrlChanged Url
    | AboutMsg About.Msg
    | AddMsg Add.Msg
    | EvaluateMsg Evaluate.Msg


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

        EvaluateMsg evaluateMsg ->
            case model.page of
                EvaluatePage evaluateModel ->
                    let
                        ( newEvaluateModel, cmd ) =
                            Evaluate.update evaluateMsg evaluateModel
                    in
                    ( { model | page = EvaluatePage newEvaluateModel }, Cmd.map EvaluateMsg cmd )

                AddPage _ ->
                    ( model, Cmd.none )

                AboutPage _ ->
                    ( model, Cmd.none )

                HomePage ->
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
            div [ class "flex justify-center gap-44  text-xl italic  bg-[#8419FF]  h-16 text-[#FFFFFF]" ]
                [ h1 [ class "  mt-4 " ] [ text "Home" ]
                , a [ href "/about", class "mt-4 " ] [ text "About" ]
                , a
                    [ href "/add"
                    , class " text-center  font-semibold italic text-[#FFFFFF] bg-[#8419FF] h-16 w-full max-w-[250px] text-xl rounded-lg flex  items-center  justify-center mt-[200px]  "
                    ]
                    [ text "Make Quiz !" ]
                , a
                    [ href "/evaluate"
                    , class " text-center  font-semibold italic text-[#FFFFFF] bg-[#8419FF] h-16 w-full max-w-[250px] text-xl rounded-lg flex  items-center  justify-center mt-[200px]  "
                    ]
                    [ text "Get Quiz !" ]
                ]

        AddPage addModel ->
            Add.view addModel |> Html.map AddMsg

        AboutPage aboutModel ->
            About.view aboutModel |> Html.map AboutMsg

        EvaluatePage evaluateModel ->
            Evaluate.view evaluateModel |> Html.map EvaluateMsg


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
