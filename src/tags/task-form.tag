<task-form>
  <form id="task-form" class="ui form segment" onsubmit={handleSubmit}>
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
      jQuery('#task-form')
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
      let valid = jQuery('#task-form').form('is valid');
      if (valid) {
        this.opts.addtask(this.newTask.value);
        this.newTask.value = '';
      }
    }
  </script>

</task-form>
