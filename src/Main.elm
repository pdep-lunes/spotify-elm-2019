port module Main exposing (..)

import Http
import Browser
import Browser.Navigation as Nav
import Task exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Url
import Url.Parser exposing (Parser, (</>), int, map, oneOf, s, string)

import Views.Home exposing (homeView)
import Views.Queue exposing (queueView)
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
    , queue = []
    , playerUrl = ""
    , filterText = ""
    , playing = Nothing
    , onlyLiked = False
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
          ( { model | songs = songs }, Cmd.none )
        Err _ ->
          ( model, Cmd.none )
    AddToQueue song ->
      ( { model | queue = addSongToQueue song model.queue }, Cmd.none )
    RemoveFromQueue id ->
      ( { model | queue = removeSongFromQueue id model.queue }, Cmd.none )
    PlayNextFromQueue ->
      ( playNextFromQueue model, Cmd.none )
    Play id ->
      ( playSong model id, Cmd.none )
    PlayPause bool ->
      ( { model | playing = Just bool }, togglePlay bool )
    Like id ->
      ( { model | songs =  toggleLike id model.songs }, Cmd.none )
    ToggleShowLiked ->
      ( { model | onlyLiked = not model.onlyLiked }, Cmd.none )
    Filter text ->
      ( { model | filterText = text }, Cmd.none )
    LinkClicked urlRequest ->
      case urlRequest of
        Browser.Internal url ->
          ( model, Nav.pushUrl model.key (Url.toString url) )
        Browser.External href ->
          ( model, Nav.load href )
    UrlChanged url ->
      ( { model | url = url }, Cmd.none )
    SongEnded _ ->
      ( { model | playing = Nothing, playerUrl = "" } , Task.perform identity (Task.succeed PlayNextFromQueue) )

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions _ =
    songEnded (\b -> SongEnded b)

-- VIEW

viewLink : String -> Html msg
viewLink path =
  li [] [ a [ href path ] [ text path ] ]

view : Model -> Browser.Document Msg
view model =
  { title = "Spotify Elm"
  , body = [ 
      div [] [
        div [ class "root" ] [
          navbar model,
          ul []
            [ viewLink "/home"
            , viewLink "/queue"
            ],
          case model.url.path of
              "/home" -> 
                homeView model
              "/" -> 
                homeView model
              "/queue" ->
                queueView model
              _ -> span [] [ text "404" ]
          ,
          player model
        ]
      ]
    ]
  }