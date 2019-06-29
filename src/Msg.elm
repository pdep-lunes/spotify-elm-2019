module Msg exposing (..)

import Http
import Browser
import Url
import Types exposing (Song)
import Models exposing (Model)

type Msg
  = NoOp
  | Filter String
  | AddToQueue Song
  | RemoveFromQueue String
  | PlayNextFromQueue
  | Play String
  | Like String
  | ToggleShowLiked
  | GotSongs (Result Http.Error (List Song))
  | LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url
  | PlayPause Bool
  | SongEnded Bool