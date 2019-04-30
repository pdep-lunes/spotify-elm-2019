module Msg exposing (..)

import Http
import Types exposing (Song)

type Msg
  = NoOp
  | Filter String
  | Play Int
  | GotSongs (Result Http.Error (List Song))