<tasks>
  <task-form addtask={this.handleNewTask}></task-form>
  <h4 class="ui horizontal divider header" if={ this.state.tasks.length> 0 }> Tasks </h4>
  <task-list tasks={this.state.tasks} handlecheck={handleTaskCompletionChange}></task-list>

  <script>
    var actions = require('../actions.js');
    var store = window.store;

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
  </script>
</tasks>
