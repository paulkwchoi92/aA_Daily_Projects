import React from "react";
import ReactDOM from "react-dom";
import Game from "./components/game.jsx";

const Root = () => {
  return (
    <div>
      <Game />
      
    </div>
  );
};

document.addEventListener("DOMContentLoaded", function() {
    const root = document.querySelector("#root");
    // debugger
    // alert(root)
  ReactDOM.render(<Root />, root);
});
