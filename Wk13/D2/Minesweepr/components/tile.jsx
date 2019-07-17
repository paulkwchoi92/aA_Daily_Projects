import React from "react";
import ReactDOM from "react-dom";

class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
    // debugger;
    this.state = {
      bombed: props.tile.bombed,
      flagged: props.tile.flagged,
      explored: props.tile.explored
    };
    //   debugger
   // this.cb = this.props.update(this, this.state.flagged)
    // debugger
  }

  handleClick(e) {
    e.preventDefault();
    if (e.altKey) {
        this.setState(
            { flagged: true }, this.props.update(this, this.state.flagged))
            // this.cb);
    } else {
        this.setState(
            { explored: true }, this.props.update(this, this.state.flagged))
        // this.cb);
    }
     
  }

  render() {
    // debugger
    // debugger
    // if (this.props.tile.bombed === true) {
    //     return (
    //         <div class="tile bombed">
    //         </div>
    //     )
    if (this.state.flagged === true) {
      return <div class="tile flagged" />;
    } else if (this.state.explored === true) {
        if (this.state.bombed === true) {
         
          return <div class="tile bombed" />;
         
          
      } else {
        return <div class="tile explored" />;
      } 
    } else {
      return <div className="tile" onClick={this.handleClick} />;
    }
  }
}

export default Tile;
