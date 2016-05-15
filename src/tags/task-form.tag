<task-form>
  <form class="ui form segment" onsubmit={handleSubmit}>
    <p>Add a new task</p>
    <div class="inline fields">
      <div class="eight wide field">
        <label>Task</label>
        <input name="newTask" type="text" placeholder="Task Description">
      </div>
    </div>
    <button class="ui button" type="submit" name="submit" value="Submit">Submit</button>
  </form>

  <script>

    this.on('mount', function () {
      jQuery('.ui.form')
        .form({
          inline: true,
          on: 'blur',
          fields: {
            newTask: 'empty'
          }
        });
    });

    handleSubmit()
    {
      let valid = jQuery('.ui.form').form('is valid');
      if (valid) {
        this.opts.addtask(this.newTask.value);
        jQuery('.ui.form').form('reset');
        jQuery('.ui.form').form('clear');
      }
    }
  </script>

</task-form>
