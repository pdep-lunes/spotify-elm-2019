module Utils exposing (..)

import Types exposing (Song)

defaultSong : Song
defaultSong = {
  id = "",
  cover = "",
  url = "",
  name = "",
  artist = "",
  liked = False
  }

findSong : (Song -> Bool) -> List Song -> Song
findSong condition songs =
  Maybe.withDefault
    defaultSong
    ((List.head << List.filter condition) songs)

tailSafe : List Song -> List Song
tailSafe songs = Maybe.withDefault [] (List.tail songs)

idFirst : List Song -> String
idFirst = Maybe.withDefault "" << Maybe.map (\s -> s.id) << List.head