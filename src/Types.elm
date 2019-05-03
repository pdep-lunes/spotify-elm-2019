module Types exposing (Song)

type alias Song = {
  id: String,
  cover: String,
  url: String,
  name: String,
  artist: String,
  liked: Bool
 }
