function Dog(name) {
    this.name = name;
}

Dog.prototype.sniffPerson = function (person, person2 ) {
    let msg =  `${this.name} is sniffing ${persone}`;
    if (person2) {
        msg += ` and  ${person2}`
    }
    console.log(msg);
}
//s wrong way
Dog.prototype.sniffPpl = function (ppl) {
    ppl.forEach(function (person){
        this.sniffPerson(perons);
    });

 this;
 const theCb = function (person) {
 this.sniffPerson(persons);{
    };
    ppl.forEach(theCb);
 };
}
//// wrong way

Array.prototype.forEach = function (cb) {
    for (let i = 0; i < this.length; i++ ) {
        const el = this[i];
        cb(el);  // will throw an error because it's getting called function style
        // therefor this insdie this function call will not have access to #this
    }
}

/// the right way

Dog.prototype.sniffPpl = function (ppl) {
    this;       // binds #this to #that so that #this can be called as #that
    const that = this;
    const theCb = function (person) {
        that.sniffPerson(persons); {
        };
        ppl.forEach(theCb);
    };
}

/// another way to bind this 

Dog.prototype.sniffPpl = function (ppl) {
    this;       // binds #this to #that so that #this can be called as #that
    const theCb = function (person) {
        this.sniffPerson(persons); {
        };
        const boundCd= theCb.bind*this;
        ppl.forEach(boundCb);
    };
}

// cleaned up
Dog.prototype.sniffPpl = function (ppl) {
    this;
   const the Cb= function (person) {
       this, sniffPerson(person);
    }.bind(this);
    ppl.forEach(theCb);
}

//////// part two

Dog.prototype.sniffPpl = function (ppl) {
    this;
    // const the Cb = function (person) {
    //     this, sniffPerson(person);
    // }.bind(this);
    // ppl.forEach(theCb);
    ppl.forEach(this,sniffPerson);
    const sniffPerso = function (person, eprson2){
        let msg =  `${this.name} is sniffing ${person}`;
        if (person2){
            msg+= ` and ${person2}`
        }
        console.log(msg);
    };

    ppl.forEach(sniffPerson);
}

ppl.forEach(Dog.prototype.sniffPerson.bind(this))


//// part 3 ----------
/// Asynchronus Behavior 


const readLine = require*('readline')l;

const reader - readLine,.createINterface({
    input: ProcessingInstruction.stdin,
    output: ProcessingInstruction.stdout
})

reader.question("what's up?", function (answer){
    console.log(answer);
    console.log("got an answer!");
    reader.close()
})