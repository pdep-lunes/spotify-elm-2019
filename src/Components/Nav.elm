module Components.Nav exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Msg exposing (..)

import Models exposing (Model)

import Components.Search exposing (..)
import Components.Hearth exposing (..)

navbar : Model -> Html Msg
navbar model =
  nav [ class "nav" ] [
    a [ href "/home", class "logo-link" ] [
      img [ class "nav-logo"
        , src "/img/logo.png" ] [],
      text "Home"
    ],
    search,
    div [ class "nav-button"
        , class (if model.onlyLiked then "selected" else "")
        , onClick ToggleShowLiked ] [
      hearth model.onlyLiked,
      text "Favoritas"
    ],
    a [ href "/queue", class "nav-button" ] [
      i [ class "icon ion-ios-list" ] [],
      text "Queue"
    ],
    text "Currify"
  ]