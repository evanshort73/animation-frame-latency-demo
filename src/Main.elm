module Main exposing (..)

import AnimationFrame
import Html exposing (Html, div, span, text)
import Html.Attributes exposing (style)
import Time exposing (Time)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias Model = Bool

init : ( Model, Cmd Msg )
init = ( False, Cmd.none )

-- UPDATE

type Msg
  = CurrentTime Time

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    CurrentTime now ->
      ( floor (Time.inSeconds now) % 2 /= 0, Cmd.none )

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  AnimationFrame.times CurrentTime

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ span
        [ style
            [ ( "background", if model then "#ff0000" else "#ffff00" )
            ]
        ]
        [ text "through elm" ]
    ]
