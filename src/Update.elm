module Update exposing (..)

import Msg exposing (..)
import Backend exposing (..)
import Models exposing (Model)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )
    GotSongs result ->
      case result of
        Ok songs ->
          ( { model | songs = songs, filteredSongs = songs }, Cmd.none )
        Err _ ->
          ( model, Cmd.none )
    Play id ->
      ( { model | url = urlById id model.songs }, Cmd.none )
    Filter text ->
      ( { model | filteredSongs = filterSongs text model.songs }, Cmd.none )