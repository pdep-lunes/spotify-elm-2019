module Models exposing (..)

type alias Song = {
  id: Int,
  url: String,
  name: String,
  artist: String
}

type alias Model = {
  songs: List Song
}

amenabar : Song
amenabar = {
  id = 1,
  url = "https://p.scdn.co/mp3-preview/a0df24b12820557d9b153232546907b51900e555?cid=774b29d4f13844c495f206cafdad9c86",
  name = "Amenábar",
  artist = "Spinetta Jade"
  }

botasLocas : Song
botasLocas = {
  id = 2,
  url = "https://p.scdn.co/mp3-preview/7764b27b5c2d938ad8d3615c744e87212b953c33?cid=774b29d4f13844c495f206cafdad9c86",
  name = "Botas Locas",
  artist = "Sui Generis"
  }

initialModel : Model
initialModel = { songs = [amenabar, botasLocas] }