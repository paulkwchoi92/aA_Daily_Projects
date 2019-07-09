const MovingObject = require("./moving_object.js");
const Util = require("./util.js")

const COLORS = ["red","green","blue","yellow"];
const RADIUS = 10;
Util.inherits(Asteroid, MovingObject);

function Asteroid (pos, game) {
    let options = { pos: pos , vel: Util.randomVec(5), radius: RADIUS, color: randColor(), game: game};
    MovingObject.call(this, options);
};
// let sample = new Asteroid([0, 0]);
module.exports = Asteroid;


function randColor () {
 return COLORS[Math.floor(Math.random() * COLORS.length)];
}