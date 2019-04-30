module Models exposing (..)

import Types exposing (Song)

type alias Model = {
  songs: List Song,
  filteredSongs: List Song,
  url: String
 }

initialModel : Model
initialModel = {
  songs = [],
  filteredSongs = [],
  url = ""
  }