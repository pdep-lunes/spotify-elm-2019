module Views.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Components.SongItem exposing (..)
import Components.Player exposing (..)
import Components.Nav exposing (..)

import Msg exposing (..)

import Data.Song exposing (Song, allTheSongs)

type alias Model = {
  songs: List Song,
  filteredSongs: List Song,
  url: String
 }

initialModel : Model
initialModel = {
  songs = allTheSongs,
  filteredSongs = allTheSongs,
  url = "https://p.scdn.co/mp3-preview/a69cabb16c6c3333db903d1f538e808493689e40?cid=774b29d4f13844c495f206cafdad9c86"
  }

homeView : Model -> Html Msg
homeView model =
  div [ class "container" ] (List.map songItem model.filteredSongs)