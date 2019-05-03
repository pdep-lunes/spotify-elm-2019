module Components.Hearth exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Msg exposing (..)

hearth : Bool -> Html Msg
hearth liked = 
  if liked then 
    img [ src "img/like.png" ] []
  else 
    img [ src "img/no-like.png" ] []