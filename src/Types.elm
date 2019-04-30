module Types exposing (Song)

type alias Song = {
  id: Int,
  cover: String,
  url: String,
  name: String,
  artist: String
 }
