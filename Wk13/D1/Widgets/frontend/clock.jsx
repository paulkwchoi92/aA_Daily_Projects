import ReactDOM from "react-dom";
import React from "react";

class Clock extends React.Component {
    constructor(props) {
        // this.prop;
        super(props);
        this.state = { date : new Date() };
        
    }
    componentDidMount() {
        this.timerID = setInterval(
         () => this.tick(),
            1000
        );
    }

    componentWillUnmount() {
        clearInterval(this.timerID);
    }

// new Date(year, monthIndex[, day[, hours[, minutes[, seconds[, milliseconds]]]]]);

    tick() {
        this.setState({
            date: new Date()
        })
        
    }
    render() {
        return (
            <div class="clockspace" >
                <h1>Hello, world!</h1>
                <h2>It is {this.state.date.toLocaleTimeString()}.</h2>
            </div>
        )
    }
}

export default Clock;
