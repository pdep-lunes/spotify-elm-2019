import axios from 'axios'
import { writeFile } from 'fs'

require('dotenv').config({path: './json-server/.env'})

const API_URL = 'https://api.spotify.com/v1'
const TOKEN = process.env.SPOTIFY_TOKEN

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
  id: string
}

type ParseTrack = {
  id: string
  image: string
  artistsNames: Array<string>
  durationString: string
  name: string
  preview_url: string
}

const parseTrack = (trackData: Track): ParseTrack => {
  const { id, album, artists, duration_ms, name, preview_url }: Track = trackData

  const image = album.images.find(
    ({ width, height }) => width === 300 || height === 300
  )
  const artistsNames = artists.map(artist => artist.name)
  const minutes = Math.floor(duration_ms / 1000 / 60)
  const seconsds = Math.ceil((duration_ms / 1000) % 60)
    .toString()
    .padStart(2, '0')
  const durationString = `${minutes}:${seconsds}`
  return {
    id,
    image: image ? image.url : '',
    artistsNames,
    durationString,
    name,
    preview_url,
  }
}

const fetchTrack = async (trackId: string) => {
  const response = await axios.get(`${API_URL}/tracks/${trackId}`, {
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
      Authorization: `Bearer ${TOKEN}`,
    },
  })
}

type FetchUserTracksParam = {
  type?: string
  limit?: number
  offset?: number
  time_range?: "medium_term" | "long_term" | "short_term"
}

const fetchUserTracksDefaultParam: FetchUserTracksParam = {
  type: 'tracks',
  limit: 1000,
  offset: 0,
  time_range: "medium_term",
}

const fetchUserTracks = async ({
  type = 'tracks',
  limit = 30,
  offset = 0,
  time_range = "medium_term"
}: FetchUserTracksParam = fetchUserTracksDefaultParam) => {
  const response = await axios.get(
    `${API_URL}/me/top/${type}?limit=${limit}&time_range=${time_range}&offset=${offset}`,
    {
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: `Bearer ${TOKEN}`,
      },
    }
  )
  return response.data.items as Array<Track>
}

async function getTracksParsed(params?: FetchUserTracksParam) {
  const userTracks = await fetchUserTracks(params)
  const tracks = userTracks
    .map((track, i) => {
      const parsed = parseTrack(track)
      return {
        id: parsed.id,
        artist: parsed.artistsNames[0],
        preview_url: parsed.preview_url,
        name: parsed.name,
        cover: parsed.image,
        liked: false,
      }
    })
    .filter(
      ({ preview_url }) => preview_url !== null && preview_url !== undefined
    )
  return tracks;
}

async function run() {
  const tracksLT = await getTracksParsed({time_range: "long_term"})
  const tracksMT = await getTracksParsed({time_range: "medium_term"})
  const tracksST = await getTracksParsed({time_range: "short_term"})

  const json = JSON.stringify({
    songs: [...tracksLT, ...tracksMT, ...tracksST]
  })
  writeFile('./public/data/db.json', json, 'utf8', (err) => {
    if (err) {
      console.log('An error occured while writing JSON Object to File.')
      return console.log(err)
    }
    console.log('JSON file has been saved.')
  })
}

run()