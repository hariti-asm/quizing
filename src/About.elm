module About exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)


type alias Model =
    {}


type Msg
    = NoOp


view : Model -> Html Msg
view model =
    div [ class "about-page" ]
        [ h1 [] [ text "About" ]
        , p [] [ text "This quiz application was created with Elm." ]
        , p [] [ text "It allows users to create and take quizzes, and view their scores." ]
        ]


init : () -> ( Model, Cmd Msg )
init _ =
    ( {}, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )
