import ReactDOM from "react-dom";
import React from "react";
import Clock from "./clock";
import Tab from "./tab";
// import Header from "./tab";

const a = [{
    title: "Paul", content: "American"
}, {
    title: "Mac", content: "American"
}]
const Root = () => {
    return (
        <div>
            <Clock />
            <Tab a={a} />
           
        </div>
   ); 
}

document.addEventListener("DOMContentLoaded", function() {
  const root = document.querySelector("#root");
  ReactDOM.render(<Root />, root);
});


