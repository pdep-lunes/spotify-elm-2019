module Views.Queue exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Components.Player exposing (..)
import Components.Nav exposing (..)
import Components.Hearth exposing (hearth)

import Msg exposing (..)
import Types exposing (Song)
import Models exposing (Model)
import Backend exposing (applyFilters, isLiked)

import Html.Events exposing (..)

songItem : Song -> Html Msg
songItem song =
  div [ class "song-container" ] [
    div [ class "song-cover-container-queue"
        , onClick (AddToQueue song) ] [
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
      div [ class "add-to-queue" ] [
        i [ class "icon ion-ios-add-circle button-add"
          , onClick (AddToQueue song) ] []
      ]
    ]
  ]

queueRow : Song -> Html Msg
queueRow song =
  div [ class "queue-row" ] [
    img [ class "queue-song-cover"
        , src song.cover
        , width 40
        , height 40 ] [],
    div [ class "queue-song-info" ] [
      span [ class "song-name" ] [ text song.name ],
      span [ class "song-artist" ] [ text song.artist ]
    ],
    div [ class "remove-from-queue" ] [
      i [ class "icon ion-ios-remove-circle button-remove"
        , onClick (RemoveFromQueue song.id) ] []
    ]
  ]

queueView : Model -> Html Msg
queueView model =
  div [] [
    div [ class "container"
        , class "queue-container" ]
        ((List.map songItem << applyFilters) model)
    , div [ class "sidebar", class (if (List.isEmpty model.queue) then "hidden" else "") ] [
      div [ class "queue-title" ] [
        h1 [ class "queue-name" ] [ text "Queue"]
      ],
      div [ class "queue-list" ] ((List.map queueRow << List.take 100) model.queue)
    ]
  ]
