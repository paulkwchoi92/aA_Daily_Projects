const HanoiGame = require('./game.js');
const HanoiView = require('./hanoi-view.js');

console.log('testest');

$(() => {
  
  const rootEl = $('.hanoi');
  const game = new HanoiGame();
  let view = new HanoiView(game, rootEl);
  
});
