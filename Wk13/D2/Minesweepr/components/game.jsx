// Start by creating a Game component using extends React.Component.In constructor(), initialize a new Minesweeper.Board and set it as the board property of the initial state object.This will be the object that we continuously update over the course of the game.

// Stub out a second function, updateGame, but don't write anything here yet. We'll return to this after we have a properly rendering board.Then, write a render method.Have it return a new React component, Board, passing in this.state.board and this.updateGame as props.The Board component will pass the updateGame function to each individual tile: ultimately, this is how we'll make sure that the board re-renders when the state of the game changes.

// Don't forget to bind your functions in your constructor.

import React from "react";
import ReactDOM from "react-dom";
import Minesweeper from "./minesweeper.js";
import Board from "./board.jsx";


// const props = {}
class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = { board: new Minesweeper.Board(8, 20) };
    // debugger
    this.updateGame = this.updateGame.bind(this);
  }

    updateGame(tile, flag) {
      if (flag) {
        tile.toggleFlag()
      } else {
        tile.explore()
      }
      this.setState({ board: this.state.board });

  }
  render() {
    return (
      <div class="board">
        <Board board={this.state.board} update={this.updateGame} />
      </div>
    );
  }
}

export default Game;
