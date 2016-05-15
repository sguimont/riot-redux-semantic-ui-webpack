<todo-app>
  <div class="ui container">
    <h2 class="ui header">
      Todo Application
      <div class="sub header">Manage your daily tasks.</div>
    </h2>
    <error-message message={this.state.errorMessage} iserror={this.state.isError} hide={hideErrorMessage}></error-message>
    <loading-indicator loading={this.state.isLoading}></loading-indicator>
    <task-form addtask={this.handleNewTask}></task-form>
    <task-list tasks={this.state.tasks} handlecheck={handleTaskCompletionChange}></task-list>
  </div>

  <script>
    var actions = require('../actions.js');
    var store = this.opts.store;

    this.on('mount', function () {
      store.dispatch(actions.loadTasks())
    });

    store.subscribe(function () {
      this.state = store.getState();
      this.update()
    }.bind(this));

    handleNewTask(task)
    {
      store.dispatch(actions.addTask(task))
    }

    handleTaskCompletionChange(id, isComplete)
    {
      store.dispatch(actions.toggleComplete(id, isComplete))
    }

    hideErrorMessage()
    {
      store.dispatch(actions.hideError())
    }
  </script>
</todo-app>
