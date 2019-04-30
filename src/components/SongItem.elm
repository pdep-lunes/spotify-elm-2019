module Components.SongItem exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Msg exposing (..)
import Models exposing (..)

songItem : Song -> Html Msg
songItem song =
  div [ class "song-container" ] [
    div [ class "song-cover-container" ] [
      img [ class "song-cover"
          , onClick (Play song.id)
          , src song.cover
          , width 150
          , height 150 ] []
    ],
    span [ class "song-name"
         , onClick (Play song.id) ] [ text song.name ],
    span [ class "song-artist" ] [ text song.artist ]
  ]