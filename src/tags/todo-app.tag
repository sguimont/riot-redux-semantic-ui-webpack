<todo-app>
  <div class="ui container">
    <h2 class="ui header">
      Todo Application
      <div class="sub header">Manage your daily tasks.</div>
    </h2>
    <error-message message={this.state.errorMessage} iserror={this.state.isError} hide={hideErrorMessage}></error-message>
    <menu></menu>
    <loading-indicator loading={this.state.isLoading}></loading-indicator>
    <route class="ui container app content"></route>
  </div>

  <script>
    var actions = require('../actions.js');
    var store = this.opts.store;

    riot.router.on('route:updated', function (data) {
      this.update();
    }.bind(this));

    store.subscribe(function () {
      this.state = store.getState();
      this.update()
    }.bind(this));

    hideErrorMessage()
    {
      store.dispatch(actions.hideError())
    }
  </script>
</todo-app>
