const MovingObject = require("./moving_object.js");
// const Util = require("./util.js")
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js")

window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.Game = Game;
window.GameView = GameView;

window.addEventListener('DOMContentLoaded', function() {
    const canvasElement = document.getElementById("game-canvas");
    const ctx = canvasElement.getContext("2d");
    const game = new GameView(ctx);
    game.start();
});

// a = new Asteroid([50,50]);
// test_game = new Game();



console.log("Webpack is working!");
