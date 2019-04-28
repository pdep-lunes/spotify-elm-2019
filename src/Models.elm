module Models exposing (..)

type alias Song = {
  id: Int,
  cover: String,
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
  cover = "https://i.scdn.co/image/18f0b839ece383f529d3bdf8aec6017dc40157ad",
  url = "https://p.scdn.co/mp3-preview/a0df24b12820557d9b153232546907b51900e555?cid=774b29d4f13844c495f206cafdad9c86",
  name = "Amenábar",
  artist = "Spinetta Jade"
  }

botasLocas : Song
botasLocas = {
  id = 2,
  cover = "https://i.scdn.co/image/47c0409198c21e1998403e1efa782d58ffa4bc17",
  url = "https://p.scdn.co/mp3-preview/7764b27b5c2d938ad8d3615c744e87212b953c33?cid=774b29d4f13844c495f206cafdad9c86",
  name = "Botas Locas",
  artist = "Sui Generis"
  }

whatsTheUse : Song
whatsTheUse = {
  id = 3,
  cover = "https://i.scdn.co/image/6dd91ca36a8dd29918947232b682f970a6fada36",
  url = "https://p.scdn.co/mp3-preview/ce5a2f2092a8a51ac05b9979057732b89cac50c0?cid=774b29d4f13844c495f206cafdad9c86",
  name = "What's the Use?",
  artist = "Mac Miller"
  }

pastizal : Song
pastizal = {
  id = 4,
  cover = "https://i.scdn.co/image/beb970319c33347e55c6f4d576308347a212c067",
  url = "https://p.scdn.co/mp3-preview/74aa9d123387e8e56213132a1df9ea1ba1026b5a?cid=774b29d4f13844c495f206cafdad9c86",
  name = "Pastizal",
  artist = "Usted Señalemelo"
  }


bohemianRhapsody : Song
bohemianRhapsody = {
  id = 5,
  cover = "https://i.scdn.co/image/f11aa4ef8ef3ff97ab9322f362f77f2eec4744a5",
  url = "https://p.scdn.co/mp3-preview/d1ff0ba5c5538ca2c50b808aab2278253c98b038?cid=774b29d4f13844c495f206cafdad9c86",
  name = "Bohemian Rhapsody",
  artist = "Queen"
  }

initialModel : Model
initialModel = {
  songs =
    [ amenabar
    , botasLocas
    , whatsTheUse
    , pastizal
    , bohemianRhapsody ]
  }