module Msg exposing (..)

import Models exposing (Path)

type Msg
  = NoOp
  | Play Int
  | Filter String
  | ChangePath Path