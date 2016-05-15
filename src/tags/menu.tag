<menu>
  <div class="ui three item menu">
    <a class={item: true, active: '/' === this.opts.current_uri} href="#">Tasks</a>
    <a class={item: true, active: '/others' === this.opts.current_uri} href="#/others">Others</a>
    <a class={item: true, active: '/test' === this.opts.current_uri} href="#/test">Test</a>
  </div>
  <script>
    riot.router.on('route:updated', function () {
      this.opts.current_uri = riot.router.current.uri;
      this.update();
    }.bind(this));
  </script>
</menu>
