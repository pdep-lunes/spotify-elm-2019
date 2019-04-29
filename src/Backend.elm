module Backend exposing (..)
import Models exposing(Song)

urlById : Int -> List Song -> String
urlById id songs = "https://p.scdn.co/mp3-preview/a69cabb16c6c3333db903d1f538e808493689e40?cid=774b29d4f13844c495f206cafdad9c86"

filterSongs : String -> List Song -> List Song
filterSongs text songs = songs