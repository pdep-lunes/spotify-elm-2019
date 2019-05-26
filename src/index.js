import './main.css';
import { Elm } from './Main.elm';

const app = Elm.Main.init({
  node: document.getElementById('root')
});

const audio = document.getElementById('audio-player');

app.ports.togglePlay.subscribe(function(bool) {
  audio.paused ? audio.play() : audio.pause();
});

audio.addEventListener('ended', function() {
  app.ports.songEnded.send(true)
});