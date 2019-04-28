module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Components.SongItem exposing (..)
import Components.Search exposing (..)

import Msg exposing (..)
import Models exposing (..)

view : Model -> Html Msg
view model =
  div [] [
    node "link" [ href "https://fonts.googleapis.com/css?family=Montserrat", rel "stylesheet" ] [],
    node "link" [ href "./style.css", rel "stylesheet" ] [],
    div [ class "root" ] [
      nav [ class "nav" ] [
        img [ class "nav-logo", src "./assets/logo.png" ] [],
        search,
        text "PdepTify"
      ],
      div [ class "container" ] (List.map songItem model.songs),
      audio [ src model.url
            , controls True
            , class "song-player" ]
            []
    ]
  ]
