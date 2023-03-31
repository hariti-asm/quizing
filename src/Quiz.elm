module Quiz exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Msg exposing (Msg)


type Msg
    = AddQuestion
    | AddQuiz
    | AddOption Int
      -- | RemoveOption Int Int
    | AddTitle String


type alias Question =
    { text : String
    , options : List ( String, String )
    , correctAnswer : String
    , mark : Int
    , answers : List String
    }


type alias Model =
    { title : String
    , questions : List Question
    , currentIndex : Int
    , score : Int
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddQuestion ->
            let
                newQuestion =
                    { text = ""
                    , options = [ ( "", "" ), ( "", "" ), ( "", "" ) ]
                    , correctAnswer = ""
                    , mark = 0
                    , answers = []
                    }
            in
            ( { model | questions = model.questions ++ [ newQuestion ] }, Cmd.none )

        AddQuiz ->
            let
                newQuiz =
                    { title = ""
                    , questions = []
                    , currentIndex = 0
                    , score = 0
                    }
            in
            ( { model | questions = model.questions ++ [], title = "", currentIndex = 0, score = 0 }, Cmd.none )

        AddOption questionIndex ->
            let
                question =
                    List.indexedMap
                        (\index q ->
                            if index == questionIndex then
                                { q | options = q.options ++ [ ( "", "" ) ] }

                            else
                                q
                        )
                        model.questions
            in
            ( { model | questions = question }, Cmd.none )

        -- RemoveOption questionIndex optionIndex ->
        --     let
        --         question =
        --             List.indexedMap
        --                 (\index q ->
        --                     if index == questionIndex then
        --                         { q | options = List.filter (\( l, v ) -> l /= optionIndex) q.options }
        --                     else
        --                         q
        --                 )
        --                 model.questions
        --     in
        --     ( { model | questions = question }, Cmd.none )
        AddTitle newTitle ->
            ( { model | title = newTitle }, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Create a New Quiz" ]
        , div []
            [ label [ for "title" ] [ text "Title: " ]
            , input [ id "title", type_ "text", value model.title, onInput (\title -> AddTitle title) ] []
            ]
        , button [ onClick AddQuestion ] [ text "Add Question" ]
        , div [] (List.indexedMap (\index question -> questionView index question) model.questions)
        , button [ disabled (List.isEmpty model.questions), onClick AddQuiz ] [ text "Add Quiz" ]
        ]


questionView : Int -> Question -> Html Msg
questionView index question =
    div [ class "question" ]
        [ h2 [] [ text ("Question " ++ String.fromInt (index + 1)) ]
        , div []
            [ label [ for ("question-" ++ String.fromInt index ++ "-text") ] [ text "Question Text: " ]
            , input
                [ id ("question-" ++ String.fromInt index ++ "-text")
                , type_ "text"
                , value question.text

                -- onInput (SelectQuestionText index)
                ]
                []
            ]
        , div []
            [ label [ for ("question-" ++ String.fromInt index ++ "-correctAnswer") ] [ text "Correct Answer: " ]
            , input [ id ("question-" ++ String.fromInt index ++ "-correctAnswer"), type_ "text", value question.correctAnswer ] []
            ]
        , div []
            [ label [] [ text "Options: " ]
            , button [ onClick (AddOption index) ] [ text "Add Option" ]
            , ul [] (List.indexedMap (\i ( label, value ) -> optionView index i label value) question.options)
            ]
        , div []
            [ label [ for ("question-" ++ String.fromInt index ++ "-mark") ] [ text "Marks: " ]
            , input [ id ("question-" ++ String.fromInt index ++ "-mark"), type_ "number", value (String.fromInt question.mark) ] []
            ]
        ]


optionView : Int -> Int -> String -> String -> Html Msg
optionView questionIndex optionIndex optionLabel optionValue =
    li []
        [ div []
            [ label [] [ text "Label: " ]

            -- , input [ id ("question-" ++ String.fromInt questionIndex ++ "-option-" ++ String.fromInt optionIndex ++ "-label"), type_ "text", value optionLabel ]
            ]
        , div []
            [ label [ for ("question-" ++ String.fromInt questionIndex ++ "-option-" ++ String.fromInt optionIndex ++ "-value") ] [ text "Value: " ]
            , input [ id ("question-" ++ String.fromInt questionIndex ++ "-option-" ++ String.fromInt optionIndex ++ "-value"), type_ "text", value optionValue ] []
            ]
        ]
