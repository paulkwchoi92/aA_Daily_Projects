import React from "react"
import ReactDOM from "react-dom";
import configureStore from "./store/store.js"
import Root from "./components/root.jsx"

document.addEventListener("DOMContentLoaded", function () {
    const root = document.querySelector("#content");
    // console.log("root: ", root);
  ReactDOM.render(<Root store={store}/>, root);
  
});

window.store= configureStore;
