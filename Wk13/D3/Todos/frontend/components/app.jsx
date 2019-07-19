import React from "react";
import ReactDOM from "react-dom";
import TodoList from "./todos/todo_list_container"
class App extends React.Component {
  constructor(props) {
    // debugger 
    super(props);
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