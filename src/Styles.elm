module Styles exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

root =
  style
    [ ("background-color", "#181818") ]

container =
  style
    [ ("max-width", "1200px")
    , ("margin", "auto")
    , ("padding", "20px")
    , ("display", "flex")
    , ("font-family", "Montserrat")
    , ("flex-wrap", "wrap") ]

cover =
  style
    [ ("height", "150px")
    , ("width", "150px")
    , ("margin", "10px") ]