import './main.css';
import { Elm } from './Main.elm';

const app = Elm.Main.init({
  node: document.getElementById('root')
});

app.ports.togglePlay.subscribe(function(bool) {
  const audio = document.getElementById('audio-player');
  audio.paused ? audio.play() : audio.pause();
});
