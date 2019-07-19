import React from "react";
import ReactDOM from "react-dom";
import uniqeId from "../../util/util";

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      id: uniqeId(),
      done: false,
      body: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    // this.updateTodo = this.updateTodo.bind(this);
    // debugger;
    // this.state =
  }

  updateTodo(attribute) {
    return e => {
      this.setState({ [attribute]: e.target.value });
    };
    //e.target.value =""
  }

  handleSubmit(e) {
    debugger;
    e.preventDefault();
    //e.target
    this.props.receiveTodo(this.state);
    this.setState({ title: "" });
    this.setState({ body: "" });
    this.setState({ id: uniqeId() });
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label htmlFor="title"> Add New Task!</label>
        <input
          type="text"
          id="todo-title"
          onChange={this.updateTodo("title")}
          value={this.state.title}
        />
        <input
          type="text"
          id="todo-body"
          onChange={this.updateTodo("body")}
          value={this.state.body}
        />
        <button>Add Task</button>
      </form>
    );
  }
}

export default TodoForm;
