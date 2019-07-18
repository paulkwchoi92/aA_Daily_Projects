import { connect } from "react-redux";
const TodoList = require ("./todo_list");
import { allTodos } from "../../reducers/selectors"

const mapStateToProps = (state) => ({
    todos: allTodos(state)

});

const mapDispatchToProps = dispatch => ({
  receiveTodo: todo => dispatch(receiveTodo(todo))
});

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(TodoList);