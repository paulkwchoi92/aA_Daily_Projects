const Asteroid = require("./asteroid.js");
const Util = require("./util.js");


Game.DIM_X = 1000;
Game.DIM_Y = 500;
Game.NUM_ASTEROIDS = 25;


function Game () {
    this.dimx = Game.DIM_X;
    this.dimy = Game.DIM_Y;
    this.asteroids = [];
    this.addAsteroids();
};


Game.prototype.addAsteroids = function () {
    for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
        this.asteroids.push(new Asteroid(this.randomPosition(), this));
    }
    
};

Game.prototype.randomPosition = function () {
    return [(Game.DIM_X * Math.random()),( Game.DIM_Y  * Math.random())]
};           

Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, this.dimx, this.dimy);
    for (let index = 0; index < this.asteroids.length; index++) {
        this.asteroids[index].draw(ctx);
    }
};

Game.prototype.moveObjects = function () {
    for (let index = 0; index < this.asteroids.length; index++) {
        this.asteroids[index].move();
    }
};
// Game.prototype.moving = function (ctx) {

//     this.moveObjects(); 
//     this.draw(ctx);
// }

Game.prototype.wrap = function(pos) {
    xpos = pos[0] % Game.DIM_X;
    if (xpos < 0 ) {xpos = (Game.DIM_X - xpos)}
    ypos = pos[1] % Game.DIM_Y;
    if (ypos < 0) {ypos = (Game.DIM_Y - ypos)}
    return [xpos, ypos];
};

Game.prototype.checkCollisions () {
    for (let index = 0; index < this.asteroids.length; index++) {
        const element = this.asteroids[index];
        for (let index2 = 0; index2 < array.length; index++) {
            const element = array[index];
            
        }
    }
}
    
module.exports = Game;