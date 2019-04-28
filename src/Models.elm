module Models exposing (..)

type alias Song = {
  id: Int,
  cover: String,
  url: String,
  name: String,
  artist: String
}

type alias Model = {
  songs: List Song,
  url: String
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

allAlongTheWatchower : Song
allAlongTheWatchower = {
  id = 6,
  cover = "https://i.scdn.co/image/b9f988b2164ef879c92175f7414726d77530a3a0",
  url = "https://p.scdn.co/mp3-preview/5eec2933740ab3984340d5f004813f8275e1bb97?cid=774b29d4f13844c495f206cafdad9c86",
  name ="All Along the Watchower",
  artist = "Jimi Hendrix"
  }

racat : Song
racat = {
  id = 7,
  cover = "https://i.scdn.co/image/c3f1a3cc46715363464bbf1b3c802825ce17932b",
  url = "https://p.scdn.co/mp3-preview/4fce7c740edf42da51bdfce5dff49d2e580405a2?cid=774b29d4f13844c495f206cafdad9c86",
  name = "Racat",
  artist = "Marilina Bertoldi"
  }

nuevo : Song
nuevo = {
  id = 8,
  cover = "https://i.scdn.co/image/0ce310a6f5c4cce34ed16332b1042710e81ebd8e",
  url = "https://p.scdn.co/mp3-preview/5098ae96e83b3180e8f2382160e3f49467e291b2?cid=774b29d4f13844c495f206cafdad9c86",
  name = "Nuevo",
  artist = "Capitán Cactus"
  }

missYou : Song
missYou = {
  id = 9,
  cover = "https://i.scdn.co/image/e15ffec01bd7c4e902d2b0c94ba270f45ca63d00",
  url = "https://p.scdn.co/mp3-preview/24d78633a528e09723b948bf787fa476666bf45c?cid=774b29d4f13844c495f206cafdad9c86",
  name = "Miss You",
  artist = "The Rolling Stones"
  }

fuego : Song
fuego = {
  id = 10,
  cover = "https://i.scdn.co/image/af4f3a6f988518c7eb425cccaf1fb7e7732cc723",
  url = "https://p.scdn.co/mp3-preview/27ee0339fa487fb13c96e07a5476e0e9097f63e1?cid=774b29d4f13844c495f206cafdad9c86",
  name = "Fuego",
  artist = "Intoxicados"
  }

initialModel : Model
initialModel = {
  songs =
    [ amenabar
    , botasLocas
    , whatsTheUse
    , pastizal
    , bohemianRhapsody
    , allAlongTheWatchower
    , racat
    , nuevo
    , missYou
    , fuego ],
  url = "https://p.scdn.co/mp3-preview/a69cabb16c6c3333db903d1f538e808493689e40?cid=774b29d4f13844c495f206cafdad9c86"
  }