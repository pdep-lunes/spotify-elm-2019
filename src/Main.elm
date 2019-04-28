import Html exposing (..)

import Models exposing (..)
import View exposing(view)
import Update exposing(update)

main = Html.beginnerProgram {
  model = initialModel,
  view = view,
  update = update
  }
