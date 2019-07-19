import React from "react";
import ReactDOM from "react-dom";

class TodoListItem extends React.Component{
    constructor(props) {
        super(props);
        // debugger
        // debugger
    }
    
    render() {
        // debugger 
        return (
            <li>
                {this.props.todo.title}
                <p> {this.props.todo.body} </p>
            </li>
        )
    }
}

export default TodoListItem;