module Models exposing (Model)

import Browser.Navigation as Nav
import Url

import Types exposing (Song)

type alias Model = {
  songs: List Song,
  filteredSongs: List Song,
  playerUrl: String,
  key: Nav.Key,
  url: Url.Url
 }