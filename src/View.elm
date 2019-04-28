module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Styles exposing (..)
import Components.SongItem exposing (..)

import Msg exposing (..)
import Models exposing (..)

view : Model -> Html Msg
view model =
  div [] [
    node "link" [ href "https://fonts.googleapis.com/css?family=Montserrat", rel "stylesheet" ] [],
    node "link" [ href "./style.css", rel "stylesheet" ] [],
    div [ root ] [
      div [ container ] (List.map songItem model.songs),
      audio [ src model.url
            , controls True ]
            []
    ]
  ]
