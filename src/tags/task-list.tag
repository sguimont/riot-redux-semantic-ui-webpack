<task-list>
  <ul class="ui segment">
    <div class="ui list" each={task in this.opts.tasks}>
      <div class="item ui checkbox">
        <input type="checkbox" id={task.id} checked={task.isComplete} onchange={handleCheck} />
        <label>{task.name}</label>
      </div>
    </div>
  </ul>

  <script>
    handleCheck(evt){
      this.opts.handlecheck(evt.target.id, evt.target.checked)
    }
  </script>
</task-list>
