port module Backend exposing (..)
import Types exposing(Song)

import Models exposing (Model)

-- Debería darnos la url de la cancion en base al id
urlById : String -> List Song -> String
urlById id songs = ""

-- Debería darnos las canciones que tengan ese texto en nombre o artista
filterByName : String -> List Song -> List Song
filterByName text songs = songs

-- Recibe un id y tiene que likear/dislikear una cancion
-- switchear song.liked
toggleLike : String -> List Song -> List Song
toggleLike id songs = songs

-- Esta funcion tiene que decir si una cancion tiene
-- nuestro like o no, por ahora funciona mal...
-- hay que arreglarla
isLiked : Song  -> Bool
isLiked song = False

-- Recibe una lista de canciones y nos quedamos solo con las que
-- tienen un like
filterLiked : List Song -> List Song
filterLiked songs = songs

-- Agrega una cancion a la cola de reproduccion
addSongToQueue : Song -> List Song -> List Song
addSongToQueue song queue = queue

-- Saca una cancion de la cola
removeSongFromQueue : String -> List Song -> List Song
removeSongFromQueue id queue = queue

-- Hace que se reproduzca la canción que sigue y la saca de la cola
playNextFromQueue : Model -> Model
playNextFromQueue model = model

applyFilters : Model -> List Song
applyFilters model =
  model.songs
    |> filterByName model.filterText
    |> if model.onlyLiked then filterLiked else identity

port togglePlay : Bool -> Cmd msg