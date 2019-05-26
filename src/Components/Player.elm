module Components.Player exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Msg exposing (..)
import Models exposing (Model)

player : Model -> Html Msg
player model =
  div [ class "player-container" ] [
    button [ class "player-button", disabled True ] [
      i [ class "icon ion-ios-skip-backward" ] []
    ],
    button [ class "player-button", disabled True ] [
      i [ class "icon ion-ios-play" ] []
    ],
    audio [ src model.playerUrl
            , controls True
            , autoplay True
            , class "song-player" ]
            [],
    button [ class "player-button" ] [
      i [ class "icon ion-ios-skip-forward" ] []
    ]
  ]