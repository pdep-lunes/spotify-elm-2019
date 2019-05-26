module Components.Player exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Msg exposing (..)
import Models exposing (Model)

playButtonDisabled : Model -> Bool
playButtonDisabled model = case model.playing of
    Nothing -> True
    _ -> False

buttonIcon : Model -> String
buttonIcon model = case model.playing of
    Nothing -> ""
    Just True -> "icon ion-ios-pause"
    Just False -> "icon ion-ios-play"
        
clickEvent : Model -> Msg
clickEvent model = case model.playing of
    Nothing -> NoOp
    Just b -> PlayPause (not b)

skipForwardButtonDisabled : Model -> Bool
skipForwardButtonDisabled model = List.isEmpty model.queue

player : Model -> Html Msg
player model =
  div [ class "player-container" ] [
    button [ class "player-button", disabled True ] [
      i [ class "icon ion-ios-skip-backward" ] []
    ],
    button [ class "player-button"
           , disabled (playButtonDisabled model)
           , onClick (clickEvent model) ] [
      i [ class (buttonIcon model) ] []
    ],
    audio [ src model.playerUrl
            , controls True
            , autoplay True
            , class "song-player"
            , id "audio-player" ]
            [],
    button [ class "player-button"
           , onClick (PlayNextFromQueue model)
           , disabled (skipForwardButtonDisabled model) ] [
      i [ class "icon ion-ios-skip-forward" ] []
    ]
  ]