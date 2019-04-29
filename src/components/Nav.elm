module Components.Nav exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Msg exposing (..)
import Models exposing (..)

import Components.Search exposing (..)

navbar : Html Msg
navbar =
  nav [ class "nav" ] [
    img [ class "nav-logo"
        , src "../public/assets/logo.png"
        , onClick (ChangePath Home) ] [],
    search,
    text "PdepTify"
  ]