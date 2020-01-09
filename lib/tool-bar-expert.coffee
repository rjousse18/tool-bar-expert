module.exports =
  deactivate: ->
    @toolBar?.removeItems()

  consumeToolBar: (toolBar) ->
    @toolBar = toolBar 'tool-bar-expert'

    @toolBar.addButton
      icon: 'file-empty'
      callback: 'application:open-file'
      tooltip: 'Open File...'
      iconset: 'icomoon'

    @toolBar.addButton
      icon: 'folder-open'
      callback: 'application:open-folder'
      tooltip: 'Open Folder...'
      iconset: 'icomoon'

    @toolBar.addButton
      icon: 'content-save'
      callback: 'core:save'
      tooltip: 'Save File'
      iconset: 'mdi'

    if atom.packages.loadedPackages['file-explorer']
      @toolBar.addButton
          'icon': 'search'
          'callback': 'file-explorer:toggle-home-directory'
          'tooltip': 'File Explorer : project root directory'
          'iconset': 'icomoon'

    @toolBar.addSpacer()

    @toolBar.addButton
      'icon': 'columns'
      'iconset': 'fa'
      'tooltip': 'Split screen - Horizontally'
      'callback': 'pane:split-right'

    btn = @toolBar.addButton
      'icon': 'columns'
      'iconset': 'fa'
      'tooltip': 'Split screen - Vertically'
      'callback': 'pane:split-down'
    btn.element.classList.add 'fa-rotate-270'

    @toolBar.addSpacer()

    @toolBar.addButton
      'iconset': 'fa'
      'icon': 'arrows-alt'
      'tooltip': 'Toggle Fullscreen'
      'callback': 'window:toggle-full-screen'

    @toolBar.addButton
      'icon': 'sitemap'
      'callback': 'tree-view:toggle'
      'tooltip': 'Toggle Sidebar'
      'iconset': 'fa'

    if atom.packages.loadedPackages['minimap']
      @toolBar.addButton
        'icon': 'eye'
        'tooltip': 'Toggle Minimap'
        'callback': 'minimap:toggle'

    if atom.packages.loadedPackages['expose']
      @toolBar.addButton
        'icon': 'browser'
        'tooltip': 'Toggle Exposé'
        'callback': 'expose:toggle'

    @toolBar.addSpacer()

    @toolBar.addButton
      'icon': 'indent'
      'callback': 'editor:auto-indent'
      'tooltip': 'Auto indent (selection)'
      'iconset': 'fa'

    if atom.packages.loadedPackages['atom-beautify']
      @toolBar.addButton
        'icon': 'star'
        'callback': 'atom-beautify:beautify-editor'
        'tooltip': 'Beautify'
        'iconset': 'fa'

    if atom.packages.loadedPackages['term3']
      @toolBar.addSpacer()
      @toolBar.addButton
        'icon': 'terminal'
        'callback': 'term3:open-split-down'
        'tooltip': 'Term3 Split Down'
    else if atom.packages.loadedPackages['term2']
      @toolBar.addSpacer()
      @toolBar.addButton
        'icon': 'terminal'
        'callback': 'term2:open-split-down'
        'tooltip': 'Term2 Split Down'
    else if atom.packages.loadedPackages['terminal-plus']
      @toolBar.addSpacer()
      @toolBar.addButton
        'icon': 'terminal'
        'callback': 'terminal-plus:toggle'
        'tooltip': 'Toggle Terminal-plus'
    else if atom.packages.loadedPackages['platformio-ide-terminal']
      @toolBar.addSpacer()
      @toolBar.addButton
        'icon': 'terminal'
        'callback': 'platformio-ide-terminal:toggle'
        'tooltip': 'Toggle Platformio-ide-terminal'

    if atom.inDevMode()

      @toolBar.addSpacer()

      @toolBar.addButton
        'icon': 'refresh'
        'callback': 'window:reload'
        'tooltip': 'Reload Window'
        'iconset': 'ion'

      @toolBar.addButton
        'icon': 'bug'
        'callback': 'window:toggle-dev-tools'
        'tooltip': 'Toggle Developer Tools'

    if atom.packages.loadedPackages['git-plus']
      @toolBar.addSpacer()
      @toolBar.addButton
        'icon' : 'git-plain'
        'callback' : 'git-plus:menu'
        'tooltip' : 'Git plus'
        'iconset' : 'devicon'
    else if atom.packages.loadedPackages['git-control']
      @toolBar.addSpacer()
      @toolBar.addButton
        'icon' : 'git-plain'
        'callback' : 'git-control:toggle'
        'tooltip' : 'Git control'
        'iconset' : 'devicon'

    if atom.packages.loadedPackages['script']
      @toolBar.addSpacer()
      @toolBar.addButton
        'icon': 'play'
        'callback': 'script:run'
        'tooltip': 'Run script'
        'iconset': 'fa'
      @toolBar.addButton
        'icon': 'fast-forward'
        'callback': 'script:run-by-line-number'
        'tooltip': 'Run by Line Number'
        'iconset': 'fa'
      @toolBar.addButton
        'icon': 'stop'
        'callback': 'script:kill-process'
        'tooltip': 'Stop script'
        'iconset': 'fa'
      @toolBar.addButton
        'icon': 'gear'
        'callback': 'script:run-options'
        'tooltip': 'Configure script'
        'iconset': 'fa'

    @toolBar.addSpacer()
    if atom.packages.loadedPackages['markdown-preview']
      @toolBar.addButton
        'icon': 'markdown'
        'callback': 'markdown-preview:toggle'
        'tooltip': 'Markdown Preview'
    if atom.packages.loadedPackages['atom-html-preview']
      @toolBar.addButton
        'icon': 'globe'
        'callback': 'atom-html-preview:toggle'
        'tooltip': 'HTML Preview'

    if atom.packages.loadedPackages['php-getters-setters']
         @toolBar.addSpacer()
         @toolBar.addButton
           'icon': 'paragraph-justify'
           'callback': 'php-getters-setters:showUI'
           'tooltip': 'GetSet : ShowUI'
           'iconset': 'icomoon'
         @toolBar.addButton
           'icon': 'menu2'
           'callback': 'php-getters-setters:allGettersSetter'
           'tooltip': 'GetSet : All'
           'iconset': 'icomoon'
         @toolBar.addButton
           'icon': 'menu3'
           'callback': 'php-getters-setters:allGetters'
           'tooltip': 'GetSet : Getters'
           'iconset': 'icomoon'
         @toolBar.addButton
           'icon': 'menu4'
           'callback': 'php-getters-setters:allSetters'
           'tooltip': 'GetSet : Setters'
           'iconset': 'icomoon'

    if atom.packages.loadedPackages['color-picker']
        @toolBar.addSpacer()
        @toolBar.addButton
          'icon': 'eyedropper'
          'callback': 'color-picker:open'
          'tooltip': 'Color Picker'
          'iconset': 'icomoon'

    if atom.packages.loadedPackages['ask-stack']
        @toolBar.addSpacer()
        @toolBar.addButton
          'icon': 'stackoverflow'
          'callback': 'ask-stack:ask-question'
          'tooltip': 'AskStack'
          'iconset': 'icomoon'

    @toolBar.addSpacer()
    @toolBar.addButton
      icon: 'keyboard'
      callback: 'command-palette:toggle'
      tooltip: 'Command Palette...'
      iconset: 'icomoon'
    @toolBar.addButton
      'icon': 'gear'
      'callback': 'settings-view:open'
      'tooltip': 'Open Settings View'
