'use strict';

require('es6-shim');

require('../semantic/dist/semantic.css');
require('imports?jQuery=jquery!../semantic/dist/semantic');

var riot = require('riot');
require('riot-router');

var redux = require('redux');
var thunk = require('redux-thunk');

require('./tags/todo-app.tag');
require('./tags/task-list.tag');
require('./tags/loading-indicator.tag');
require('./tags/task-form.tag');
require('./tags/error-message.tag');
require('./tags/menu.tag');

require('./tags/tasks.tag');

require('./tags/not-found.tag');

var reducer = function (state = {tasks: []}, action) {
  console.log(action);
  switch (action.type) {
    case 'CLEAR_TASKS':
      return Object.assign({}, state, {tasks: []});
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

var createStoreWithMiddleware = redux.compose(
  redux.applyMiddleware(thunk)
)(redux.createStore);

var reduxStore = createStoreWithMiddleware(reducer);
window.store = reduxStore;

var Route = riot.router.Route;
var DefaultRoute = riot.router.DefaultRoute;
var NotFoundRoute = riot.router.NotFoundRoute;
var RedirectRoute = riot.router.RedirectRoute;

riot.router.routes([
  new DefaultRoute({tag: 'tasks'}),
  new NotFoundRoute({tag: 'not-found'})
]);

document.addEventListener('DOMContentLoaded', () => {
  riot.mount('todo-app', {store: reduxStore});
  riot.router.start();
});
