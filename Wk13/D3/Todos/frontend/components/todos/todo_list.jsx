import React from "react";
import ReactDOM from "react-dom";
import TodoListItem from "../todo_list/todo_list_item";
import TodoForm from "../todo_list/todo_form"
import receiveTodo from "../../actions/todo_actions"

class TodoList extends React.Component {
  constructor(props) {
      super(props);
    //   debugger
  }

  render() {
    // debugger
    let arr = this.props.todos;
    // debugger
    return (
      <div>
            <TodoForm receiveTodo={this.props.receiveTodo}/>
        <ul>
          {arr.map(todo => {
            return <TodoListItem todo={todo} key={todo.id} />;
          })}
        </ul>
      </div>
    );
  }
}

export default TodoList;
