module Components.Nav exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Msg exposing (..)

import Components.Search exposing (..)

navbar : Html Msg
navbar =
  nav [ class "nav" ] [
    img [ class "nav-logo"
        , src "/img/logo.png" ] [],
    search,
    text "PdepTify"
  ]