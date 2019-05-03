module Msg exposing (..)

import Http
import Browser
import Url
import Types exposing (Song)

type Msg
  = NoOp
  | Filter String
  | Play Int
  | Like Int
  | GotSongs (Result Http.Error (List Song))
  | LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url