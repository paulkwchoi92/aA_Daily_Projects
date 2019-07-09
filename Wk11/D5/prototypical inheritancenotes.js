function Dog(name, toy) {
    this.name = name;
    this.favoriteToy = toy; 
}

Dog.prototype.bark = function () {
    console.log("woof woof");
};

function Cat(name) {
    this.name = name;
};


Cat.prototype.meow = function () {
    console.log("meow");
};

function Animal(name) {
    this.name = name;
};

Animal.prototype.eat = function () {
    console.log("nom nom nom");
};

const lola = new Dog("Lola", "squeaky");
const charlie = new Cat("charlie")


// Object.prototype -> proto.prot ->> proto.proto.proto

// setting up the chain 

// Dog.prototype = Animal.prototype;

Dog.prototype = new Animal();

function Surrogate() {}; // official AppAcdemy way
Surrogate.prototype = Animal.prototype; 
Dog.prototype = new Surrogate


Dog.prototype - Object.create(Animal.prototype); // another way to do this



class Animal {
    constructor(name){

    }
    eat () {

    }
}

class Dog extends Animal {
    constructor
}

function Dog(name, toy) {
    Animal.call(this, name);
    this.favoritesToy = toy;
}



