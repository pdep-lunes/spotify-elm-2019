module Views.Home exposing (homeView)

import Html exposing (..)
import Html.Attributes exposing (..)
import Components.SongItem exposing (..)
import Components.Player exposing (..)
import Components.Nav exposing (..)

import Msg exposing (..)
import Models exposing (..)

homeView : Model -> Html Msg
homeView model =
  div [ class "container" ] (List.map songItem model.filteredSongs)