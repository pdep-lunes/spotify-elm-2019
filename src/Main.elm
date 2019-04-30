module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)

import Models exposing (Model, initialModel)

import Views.Home exposing (homeView)
import Components.Nav exposing (navbar)
import Components.Player exposing (player)

import Msg exposing (..)
import Update exposing (update)

import Data.Song exposing (getAllTheSongs)
import Types exposing (Song)

init : ( Model, Cmd Msg )
init = ( initialModel, getAllTheSongs )

view : Model -> Html Msg
view model =
  div [] [
    div [ class "root" ] [
      navbar,
      homeView model,
      player model
    ]
  ]

main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
