class Cat {
    constructor(name) {
        this.name = name;
    }

    meow () {
        console.log(`{this.name} says meow@`);
    }

    playWith(person1, person2) {
        console.log(`${this.name} plays with ${Pperson1} and ${person 2}`)
    }
}

const curie = new Cat("Curie");
const unbownMeow - Cat.prototype.meow;
const boundMeow = unbownMeow.myBind(curie);
setTimeout(boundmeow, 1000)


Function.prototype.myBind - function (ctx) {
    this;
    return () => {
        return this.apply(ctx)
    };
};

Function.prototype.myBind = function (ctx, ...bindArgs) {
    return (...callArgs) => {
        callArgs
        return this.apply(ctx, bindArgs.concat(callArgs));
    };
}

Function.prototype.myBind = function (ctx){
    var bindArgs = Array.prototype.call(arguments), 1; // everything that comes in
    var bindArs = p[.slice.all(argumetns,1));]
    return () => {
        var callArgs = [].slice.call(arguments;)
        callArgs
        return this.apply(ctx, bindArgs.concat(callArgs));
    };

}

Array.prototype.slice = function (i = 0){
    const result = [];
    for (let i = i; i < this.length; i++){
        result.push(this[i])
    }
    return result
}

class inheritence //*** old school syntax required for test