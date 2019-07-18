import React from "react";
import ReactDOM from "react-dom";
import TodoList from "./todos/todo_list_container"
class App extends React.Component {
  constructor() {
    super();
  }
  render() {
      return (
          <div>
              <TodoList />
          </div>

      )
  }
};

export default App;