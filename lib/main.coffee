async = require 'async'

module.exports = 
  sync: (runs, cb) ->
    start = Date.now()
    cb() for _ in Array(runs)
    (Date.now() - start) / runs
    
  async: (runs, task, cb) ->
    start = Date.now()
    wrap = (_, done) -> task -> done()
    async.forEach [0...runs], wrap, ->
      cb (Date.now() - start) / runs