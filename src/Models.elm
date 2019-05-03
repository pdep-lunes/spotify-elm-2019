module Models exposing (Model)

import Browser.Navigation as Nav
import Url

import Types exposing (Song)

type alias Model = {
  songs: List Song, -- songs from db.json
  playerUrl: String, -- url of current song
  onlyLiked: Bool,
  filterText: String,
  key: Nav.Key, -- navigation
  url: Url.Url -- navigation
 }