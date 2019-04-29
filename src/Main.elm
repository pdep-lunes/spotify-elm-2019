import Browser exposing (..)

import Models exposing (..)
import View exposing(view)
import Update exposing(update)

main = Browser.sandbox {
  init = initialModel,
  view = view,
  update = update
  }