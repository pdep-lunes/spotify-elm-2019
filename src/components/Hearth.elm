module Components.Hearth exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Msg exposing (..)

hearth : Bool -> Html Msg
hearth liked = 
  if liked then 
    i [ class "icon ion-ios-heart selected" ] []
  else 
    i [ class "icon ion-ios-heart-empty" ] []