module Components.Player exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Msg exposing (..)
import Models exposing (Model)

player : Model -> Html Msg
player model =
  div [ class "player-container" ] [
    audio [ src model.url
            , controls True
            , autoplay True
            , class "song-player" ]
            []
  ]