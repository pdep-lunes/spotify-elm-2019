module Views.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Components.SongItem exposing (..)
import Components.Player exposing (..)
import Components.Nav exposing (..)

import Msg exposing (..)
import Types exposing (Song)
import Models exposing (Model)
import Backend exposing (applyFilters)

homeView : Model -> Html Msg
homeView model =
  div [ class "container" ] ((List.map songItem << applyFilters) model)