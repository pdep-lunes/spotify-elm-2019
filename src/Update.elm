module Update exposing (..)

import Msg exposing (..)
import Models exposing (..)
import Backend exposing (..)

update : Msg -> Model -> Model
update msg model =
  case msg of
    NoOp ->
      model
    Play id ->
      { model | url = urlById id model.songs }
    Filter text ->
      { model | filteredSongs = filterSongs text model.songs }