const View = require("./ttt-view.js");
const Game = require("./game.js");

$(() => {
  const $ttt = $('.ttt');
  let game = new Game();
  let view = new View(game, $ttt);

  });
