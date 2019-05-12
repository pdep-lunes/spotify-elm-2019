module Msg exposing (..)

import Http
import Browser
import Url
import Types exposing (Song)

type Msg
  = NoOp
  | Filter String
  | AddToPlaylist Song
  | RemoveFromPlaylist String
  | Play String
  | Like String
  | ToggleShowLiked
  | GotSongs (Result Http.Error (List Song))
  | LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url