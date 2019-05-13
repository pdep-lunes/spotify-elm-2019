module Data.Song exposing (getAllTheSongs)

import Http
import Json.Decode as D
-- import Json.Encode as E

import Msg exposing (..)
import Types exposing (Song)

-- DECODE

decoder : D.Decoder (List Song)
decoder =
  D.field "songs" (
    D.list (
      D.map6 Song
        (D.field "id" D.string)
        (D.field "cover" D.string)
        (D.field "preview_url" D.string)
        (D.field "name" D.string)
        (D.field "artist" D.string)
        (D.field "liked" D.bool)
    )
  )

getAllTheSongs : Cmd Msg
getAllTheSongs =
  Http.get
    { url = "/data/db.json"
    , expect = Http.expectJson GotSongs decoder }
