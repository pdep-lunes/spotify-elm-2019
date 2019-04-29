module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Components.SongItem exposing (..)
import Components.Player exposing (..)
import Components.Nav exposing (..)

import Msg exposing (..)
import Models exposing (..)

homeView : Model -> Html Msg
homeView model =
  div [ class "container" ] (List.map songItem model.filteredSongs)

viewByPath : Model -> Html Msg
viewByPath model =
  case model.path of
      Home ->
        homeView model
      Playlist ->
        div [] []

view : Model -> Html Msg
view model =
  div [] [
    node "link" [ href "https://fonts.googleapis.com/css?family=Montserrat", rel "stylesheet" ] [],
    node "link" [ href "../public/style.css", rel "stylesheet" ] [],
    div [ class "root" ] [
      navbar,
      viewByPath model,
      player model
    ]
  ]