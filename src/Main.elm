module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)

import Views.Home exposing (homeView)
import Components.Nav exposing (navbar)
import Components.Player exposing (player)

import Models exposing (Model, initialModel)

import Msg exposing (..)

init : ( Model, Cmd Msg )
init = ( initialModel, Cmd.none )

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  ( model, Cmd.none )

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
