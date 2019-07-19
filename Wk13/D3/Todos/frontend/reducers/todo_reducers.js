//import { createStore } from "redux";

import { RECEIVE_TODOS, RECEIVE_TODO } from "../actions/todo_actions";
import  merge  from "lodash/merge";


const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false 
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

const newTodos = [
   {id: 1, title:"something" },
    { id: 2, title: "test " }
]
const todosReducer = (state = initialState, action ) => {
  // debugger
    switch (action.type) {
        case RECEIVE_TODOS: 
            // debugger
            const newState1 = {}
            action.todos.forEach(td => {
               // console.log("TD: ", td);
               // console.log("newState1: ", newState1);
                newState1[td.id] = td;
            })
            
      return newState1;
      case RECEIVE_TODO: 
        debugger 
          const newState = merge(
              {},
              state,
            { [action.todo.id]: action.todo });
          return newState;             
    default:
      return state;
  }
};

export default todosReducer;
