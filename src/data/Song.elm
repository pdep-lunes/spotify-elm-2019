module Data.Song exposing (getAllTheSongs)

import Http
import Json.Decode as D
-- import Json.Encode as E

import Msg exposing (..)
import Types exposing (Song)

-- DECODE

decoder : D.Decoder Song
decoder =
  D.map5 Song
    (D.field "id" D.int)
    (D.field "cover" D.string)
    (D.field "url" D.string)
    (D.field "name" D.string)
    (D.field "artist" D.string)

getAllTheSongs : Cmd Msg
getAllTheSongs =
  Http.get
    { url = "http://localhost:3000/songs"
    , expect = Http.expectJson GotSongs (D.list decoder) }