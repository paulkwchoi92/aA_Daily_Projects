// this is how to comment 
// *** 

htm_file -> inspectro 


console.log(
    "Hello world"
;) // equivalent to ruby puts


// Falsey values in Ruby: nil, false 
// Falsey values in Javascript: null, false, undefined, NaN, '', 0, -0

// There are no implict returns in JS,
// THere is only explicit returns

// #=== is operators similar to == in ruby it checks of object equivlanece
// #== checks two things being compared is the same type, if not the same type
    // makes the two things convert to be similar and checks afterwards
    // stay away from the == 

// vairalbes and methods in JS, you use camelCase instead of snake_case

// Data types (primites):
String 
Number
Boolean
null
undefined
Symbol 
// mutalbe datas
Object //similar to ruryb has 
{ 
    tommy: "hi",
    mashu: 5,
    maia: function () {}
}

Array [1, 2, 3, 4, 5,]
Function 
    function() {}
;// similar to ruby Procs


//-----------------------------
//// varialbe Declarations 
//-----------------------------

var name = "tommy";  //older way of setting variable
name; //accessing variable 

const lname = "Duek"; //assigning constant variable
lname // accessing 

const myArr = [];
myArr.push(5) // will work because the constant points to the array bracket 

let someVar = 5; //variable 
someVar = 6; 

// var vs let 
// let is available inside the block of defining method 
// var is avialbe throughout the entire project

//-------------------------------
//---- function -----------------
//-------------------------------

function () {};
const myFunc = function () {};

function myNamedFunc() {};

myFunc(); // calling my func
myNamedFunc();  // calling my named func

function sayHi(name) {
    console.log('hi ${ name }');
};

sayHi("Tommy");

const person = {
    name: "tommy"
    sayHi: function () {
        this;
        debugger;
        console.log('${ this.name} says hi')
    }
}

// this in JS is similar to self


person.sayHi() // method style 

let mySayHi = person.sayHi; 
// fucntion-styl, this is the window or undefined 


function Cat() {
    this;
    this.name = "Seenacy";
    this.meow = function() {
        console.log(' ${ this,name } says meow');
    }
};

const sennacy = new Cat(); // constructor sytl, ' this' is the instance getting permuted

//--------------------
//---- Fat arrow functions----
//-------------------


const otherFunc = () => {

};

const anotherFunc = () => 5;

function Cat(name  ) {
    this; 
    this.name = name; 
    this.myFatFunc = () => {
        this;
        debugger;
    };
};

///------------------------
//-------- HOISTING -----
//----------------------
var myVar;

debugger 

myVar = 5;

let favFood = 'Taco';

if (true) {
    
    console.log(favFood;)
    let favFood = 'Pizza';
    console.log(favFood);
}

console.log(favFood)


//hoisting function 


var myFunc = fucntion () {};

function myOtherFunc() {};

var hoist vs function hoist

//--------------------
//   closure 
//--------------------





//--------------------
//   callbacks
//--------------------


const a = [1, 2, 3, 4, 5];

a.forEach(fucntion (el)) {
    console.log(el);

})

const myCb = function(el) {
    console.log(el);
};


const each = function (arr, cb) {
    for (let i = 0; i < arr.length; i++) {
        const theEl = arr[i];
        cb(theEl);
    }
;}