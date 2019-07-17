module.exports = {
    context: __dirname,
    entry: "./front"
}


to package json 
add  under scripts:
"test": "echo \"Error: no test specified\" && exit 1",
    "webpack": "webpack -- watch -- mode -developtment"


insdie the entry.js 

import ReactDOM from 'react-dom';

document.addEventListener("DOMContentLoaded", function () {
    const root = document.getElementById("root");
    // ReactDOM.render("Hello, world!", root)

    // const hello = React.createElement("hi", null, ["hello, world!@"])
    // ReactDOM.render(hello, root)

    //     const article = React.createElement(
    //         "article",
    //         null,
    //         [
    //             React.createElement("p", null, ["hello frist"]),
    //             React.createElement("p", null, ["hello secdrist"])
    //         ])
    // })

    const article = <article>
        <p>hello frist </p>
        <p> hello secdrist</p>
    </article>// same thing as above
    ReactDOM.render((article, root)
        
//can also be 
    
ReactDOM.render(<App />, root);
    
})
// if exportingh

import React fomr 'react'

const App = () => {
    return <section>
        <h1>   Hell from the app</h1>
    </section>
}
 export deafult App;


 ////---- nested componetsts and props 


const hello = Reacte.createElement(App, {
    name: "batman"
})
    
import React fomr 'react' 

const App = (prop ) => {
    return <section>
        <h1>   Hell `{prop}` `</h1>
    </section>
}
 export deafult App;

ReactDOM.render(<App name={name}\>, root)

class componenets 


constructor (props) {
        
}