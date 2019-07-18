
 export const allTodos = (state) => {
     const todoId = Object.keys(state.todos);
    const todoArr = todoId.map(id => state.todos[id])
    return todoArr
}


window.selector = allTodos