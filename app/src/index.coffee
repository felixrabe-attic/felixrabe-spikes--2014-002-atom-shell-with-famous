app = require 'app'
BrowserWindow = require 'browser-window'
path = require 'path'

app.on 'ready', ->
  window = new BrowserWindow width: 800, height: 600
  setImmediate ->
    window.setKiosk true
  setTimeout ->
    window.loadUrl 'file://' + path.join __dirname, 'index.html'
  , 1500
  setTimeout ->
    app.quit()
  , 7500
