module View exposing (..)

import Html exposing (..)

import Msg exposing (..)
import Models exposing (..)

view : Model -> Html Msg
view model = 
  div [] [
    span [] [ Html.text "Hello World!"]
  ]
