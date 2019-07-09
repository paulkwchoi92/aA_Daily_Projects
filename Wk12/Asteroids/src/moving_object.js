const Util = require("./util.js")


function MovingObject (options) {
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
    this.game = options.game;
};


MovingObject.prototype.draw = function (ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();
    // debugger
    ctx.arc(
        this.pos[0],
        this.pos[1],
        this.radius,
        0,
        2 * Math.PI,
        false
    );
    ctx.fill();
    
};

MovingObject.prototype.move = function () {
    let x = this.pos[0] + this.vel[0];
    let y = this.pos[1] + this.vel[1];
    this.pos = this.game.wrap([x, y]);
};

MovingObject.prototype.isCollidedWith = function (otherobject) {
    const x_diff = (this.pos[0] - otherobject.pos[0])
    const y_diff = (this.pos[1] - otherobject.pos[1])
    const radius_diff = (this.radius + otherobject.radius)

    if (x_diff < radius_diff && y_diff < radius_diff)
        return true
} ;    


// console.log("moving object test")
// const options = { pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00" }
// console.log("---------------------")
// const sample = new MovingObject(options)
// console.log(sample.draw)
// console.log(sample)
module.exports = MovingObject;
