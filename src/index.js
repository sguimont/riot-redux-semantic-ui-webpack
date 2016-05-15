var riot = require('riot');
var redux = require('redux');
var thunk = require('redux-thunk');
require('es6-shim');

require('../semantic/dist/semantic.css');
require('imports?jQuery=jquery!../semantic/dist/semantic');

require('./tags/todo-app.tag');
require('./tags/task-list.tag');
require('./tags/loading-indicator.tag');
require('./tags/task-form.tag');
require('./tags/error-message.tag');

var reducer = function (state = {tasks: []}, action) {
  console.log(action);
  switch (action.type) {
    case 'TASKS_LOADED':
      return Object.assign({}, state, {tasks: action.data});
    case 'TOGGLE_LOADING':
      return Object.assign({}, state, {isLoading: action.data});
    case 'TASK_ADDED':
      return Object.assign({}, state, {tasks: state.tasks.concat(action.data)});
    case 'TASK_COMPLETION_CHANGED':
      var taskIndex = state.tasks.findIndex(function (task) {
        return task.id == action.data.id
      });
      var newTasks = [
        ...state.tasks.slice(0, taskIndex),
        Object.assign({}, state.tasks[taskIndex], {isComplete: action.data.isComplete}),
        ...state.tasks.slice(taskIndex + 1)
      ];
      return Object.assign({}, state, {tasks: newTasks});
    case 'SHOW_ERROR':
      return Object.assign({}, state, {isError: true, errorMessage: action.data});
    case 'HIDE_ERROR':
      return Object.assign({}, state, {isError: false, errorMessage: ''});
    default:
      return state
  }
};

// var reduxStore = redux.createStore(reducer)
var createStoreWithMiddleware = redux.compose(
  redux.applyMiddleware(thunk)
)(redux.createStore);

var reduxStore = createStoreWithMiddleware(reducer);

document.addEventListener('DOMContentLoaded', () => {
  riot.mount('todo-app', {store: reduxStore});
});
