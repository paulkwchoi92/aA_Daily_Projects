// different ways to call a function 
Dog.prototype.sniff = function (person, person2) {
    let msg = `${this.name } is sniffing %{person}`;
    if (person2) {
        msg+= ` and ${ person2}`
    }
    console.log(msg);
}

// //-----# consturctortyle
// building an instance of a new function
// e.x const lola = new DOMStringList("Lola")
// //----- #method style 
// calling dirrectly on a reciever
// ex lola.sniffPerson("tommy")
// // -----#functionstyle
// const sniff = Dog.prototype.sniffPerson;
// sniff()

//----------------------
// two more ways to call a function 
//----------------------

Function.prototype.myFunction = fuction () {}

myFunction.call(lola)
 // in this #call method "this" becomes lola
//  what eever gets passed into the first argument pecomes the "this"
// sniff.call(lola, "tommy", "mashu")
//  the arguments for this method will be paswed on in order
//sniff.call({name: "Toto:"}, "tommy")
//  will give access to this.name 


sniff.(lola, ["tommy", "mashu"])
//   first arguemnt will be the this
// following arguments need to be in an array

const args = ["tommy", "mashu"];
sniff.call(lola, ...args);
// works same as * argument in ruby