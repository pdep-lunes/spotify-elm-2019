module Models exposing (Model)

import Browser.Navigation as Nav
import Url

import Types exposing (Song)

type alias Model = {
  songs: List Song, -- songs from db.json
  
  -- TODO: no me gusta tener las canciones acá
  -- en la playlist, creo que es mejor tener
  -- ids
  playlist: List Song,
  playerUrl: String, -- url of current song
  onlyLiked: Bool,
  filterText: String,
  key: Nav.Key, -- navigation
  url: Url.Url -- navigation
 }