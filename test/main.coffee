benji = require '../'
should = require 'should'
require 'mocha'

describe 'benji', ->
  describe 'sync()', ->
    it 'should run correctly (10 runs)', (done) ->
      count = 10
      task = -> --count
      ms = benji.sync count, task
      should.exist ms
      count.should.equal 0
      done()

  describe 'async()', ->
    it 'should run correctly (10 runs)', (done) ->
      count = 10
      task = (cb) -> cb --count
      ms = benji.async count, task, (ms) ->
        should.exist ms
        count.should.equal 0
        done()