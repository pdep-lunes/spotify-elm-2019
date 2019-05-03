module Backend exposing (..)
import Types exposing(Song)

urlById : Int -> List Song -> String
urlById id songs = ""

filterSongs : String -> List Song -> List Song
filterSongs text songs = songs

toggleLike : Int -> List Song -> List Song
toggleLike id songs = songs