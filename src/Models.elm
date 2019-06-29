module Models exposing (Model)

import Browser.Navigation as Nav
import Url

import Types exposing (Song)

type alias Model = {
  songs: List Song, -- songs from db.json
  queue: List Song,
  -- TODO: no me gusta tener las canciones acá
  -- en la queue, creo que es mejor tener
  -- ids
  playerUrl: String, -- url of current song
  onlyLiked: Bool,
  filterText: String,
  playing: Maybe Bool,
  key: Nav.Key, -- navigation
  url: Url.Url -- navigation
 }