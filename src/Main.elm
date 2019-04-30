module Main exposing (..)

import Http
import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url

import Views.Home exposing (homeView)
import Components.Nav exposing (navbar)
import Components.Player exposing (player)

import Backend exposing (..)
import Models exposing (Model)

import Data.Song exposing (getAllTheSongs)
import Types exposing (Song)
import Msg exposing (..)

-- MAIN

main : Program () Model Msg
main =
  Browser.application
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlRequest = LinkClicked
    , onUrlChange = UrlChanged
    }

-- MODEL

init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key = 
  ( { songs = []
    , filteredSongs = []
    , playerUrl = ""
    , key = key
    , url = url }
  , getAllTheSongs
  )

-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )
    GotSongs result ->
      case result of
        Ok songs ->
          ( { model | songs = songs, filteredSongs = songs }, Cmd.none )
        Err _ ->
          ( model, Cmd.none )
    Play id ->
      ( { model | playerUrl = urlById id model.songs }, Cmd.none )
    Filter text ->
      ( { model | filteredSongs = filterSongs text model.songs }, Cmd.none )
    LinkClicked urlRequest ->
      case urlRequest of
        Browser.Internal url ->
          ( model, Nav.pushUrl model.key (Url.toString url) )

        Browser.External href ->
          ( model, Nav.load href )
    UrlChanged url ->
      ( { model | url = url }
      , Cmd.none
      )

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- VIEW

view : Model -> Browser.Document Msg
view model =
  { title = "Spotify Elm"
  , body = [ 
      div [] [
        div [ class "root" ] [
          navbar,
          homeView model,
          player model
        ]
      ]
    ]
  }