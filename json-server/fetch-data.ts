const axios = require('axios')

const API_URL = "https://api.spotify.com/v1"
const TOKEN = ""

type Artist = {
  name: string
}

type Image = {
  width: number
  height: number
  url: string
}

type Album = {
  album_type: string
  artists: Array<Artist>
  images: Array<Image>
  name: string
  release_date: string
}

type Track = {
  album: Album
  artists: Array<Artist>
  duration_ms: number
  name: string
  preview_url: string
}

type ParseTrack = {
  image: string
  artistsNames: Array<string>
  durationString: string
  name: string
  preview_url: string
}

const parseTrack = (trackData: Track): ParseTrack => {
  const {
    album,
    artists,
    duration_ms,
    name,
    preview_url
  }: Track = trackData

  const image = album.images.find(({width, height}) => width === 300 || height === 300)
  const artistsNames = artists.map(artist => artist.name)
  const minutes = Math.floor(duration_ms / 1000 / 60)
  const seconsds = Math.ceil(duration_ms / 1000 % 60).toString().padStart(2, '0')
  const durationString = `${minutes}:${seconsds}`
  return {
    image: image.url || '',
    artistsNames,
    durationString,
    name,
    preview_url
  }
}

const fetchTrack = async (trackId: string) => {
  const response = await axios.get(`${API_URL}/tracks/${trackId}`, {
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": `Bearer ${TOKEN}`
    }
  })
}

type FetchUserTracksParam = {
  type?: string
  limit?: number
  offset?: number
  time_range?: string
}
const fetchUserTracksDefaultParam = {
  type: 'tracks',
  limit: 30,
  offset: 0,
  time_range: 'medium_term',
}
const fetchUserTracks = async ({
  type = 'tracks',
  limit = 30,
  offset = 0,
  time_range = 'medium_term',
}: FetchUserTracksParam = fetchUserTracksDefaultParam) => {
  const response = await axios.get(
    `${API_URL}/me/top/${type}?limit=${limit}&time_range=${time_range}&offset=${offset}`
  , {
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": `Bearer ${TOKEN}`
    }
  })
  const tracks: Array<Track> = response.data.items
  return tracks;
}

async function run() {
  const userTracks = await fetchUserTracks({type: 'tracks', limit: 1000, time_range: 'long_term'})
  const x = userTracks
    .map((track, i) => {
      const parsed = parseTrack(track)
      return ({
        id: i + 1,
        artist: parsed.artistsNames[0],
        preview_url: parsed.preview_url,
        name: parsed.name,
        cover: parsed.image
      })
    })
  console.log(JSON.stringify(x,null,2))
}
run()