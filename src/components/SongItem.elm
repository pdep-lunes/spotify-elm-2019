module Components.SongItem exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Msg exposing (..)

import Types exposing (Song)

import Backend exposing (isLiked)

import Components.Hearth exposing (hearth)

songItem : Song -> Html Msg
songItem song =
  div [ class "song-container" ] [
    div [ class "song-cover-container"
        , onClick (Play song.id) ] [
      img [ class "song-cover"
          , src song.cover
          , width 150
          , height 150 ] []
    ],
    div [ class "song-data" ] [
      div [ class "song-info" ] [
        span [ class "song-name"
          , onClick (Play song.id) ] [ text song.name ],
        span [ class "song-artist" ] [ text song.artist ]
      ],
      div [ class "song-hearth"
          , onClick (Like song.id) ] [ (hearth << isLiked) song ]
    ]
  ]