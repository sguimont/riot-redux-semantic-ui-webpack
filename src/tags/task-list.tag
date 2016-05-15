<task-list>
  <div class="ui segment" if={ this.opts.tasks.length > 0 }>
    <div class="ui list" each={task in this.opts.tasks}>
      <div class="item ui checkbox">
        <input type="checkbox" id={task.id} checked={task.isComplete} onchange={handleCheck} />
        <label>{task.name}</label>
      </div>
    </div>
  </div>

  <script>
    handleCheck(evt){
      this.opts.handlecheck(evt.target.id, evt.target.checked)
    }
  </script>
</task-list>
