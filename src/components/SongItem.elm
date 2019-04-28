module Components.SongItem exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msg exposing (..)
import Models exposing (Song)

songItemStyle =
  style
    [ ("display", "flex")
    , ("flex-direction", "column")
    , ("justify-content", "left")
    , ("margin", "4px") ]

name =
  style
    [ ("color", "white")
    , ("font-size", "18px")
    , ("text-decoration", "none")
    , ("margin-top", "6px") ]

artist =
  style
    [ ("color", "#949494")
    , ("font-size", "14px")
    , ("margin-top", "2px")
    , ("font-weight", "bold") ]

songItem : Song -> Html Msg
songItem song =
  div [ songItemStyle ] [
    img [ src song.cover, width 150, height 150 ] [],
    a [ name, href song.url, target "_blank" ] [ text song.name ],
    span [ artist ] [ text song.artist ]
  ]