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
    img [ class "nav-logo"
        , src "/img/logo.png" ] [],
    search,
    div [ class "nav-toggle-only-liked"
        , class (if model.onlyLiked then "selected" else "")
        , onClick ToggleShowLiked ] [
      hearth model.onlyLiked,
      text "Favoritas"
    ],
    text "Currify"
  ]