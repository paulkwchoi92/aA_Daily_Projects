import React from "react";
import ReactDOM from "react-dom";
import Tile from "./tile.jsx"

class Board extends React.Component {
    constructor(props) {
        super(props);
        // debugger
    }
    
    render() {
        return (
            <div>
                {this.props.board.grid.map((obj, i) => {
                    return(
                    <div class="row" key={i}>{
                        obj.map((tile, j) => {
                            // debugger
                            return (
                                <Tile tile={tile} update={this.props.update} key={j} />
                            )
                        // <li key={j}> ABC </li>
                    })}
                    </div>    
                )})}
        </div>);
    }
    
}

export default Board;