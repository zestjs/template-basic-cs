connect = require 'connect'
zest = require 'zest-server'

###
 * ZestJS NodeJS Server Example
 *
 * 
 * For more info, and configuration options such as how to alter 
 * client code paths, and disable Zest Server file serving, see:
 * http://zestjs.org/docs#Using%20Zest%20Server%20within%20a%20NodeJS%20Application
 *
###


app = connect()

zest.init 'dev', ->
  app.use zest.server
  app.listen 8080



###

# Native ZestJS example:

zest = require 'zest-server'
http = require 'http'

zest.init 'dev', ->
  zest.require ['zoe'], (zoe) ->
    handler = zoe.fn 'ASYNC'

    # custom handler - if it doesn't call 'next'
    # then zest won't do routing
    handler.on (req, res, next) ->
      if someCondition
        return next();

      # custom render call
      zest.renderPage
        title: 'Page Title'
        structure: 'my/component/id'
        options: {}

    handler.on zest.server

    http.createServer(handler).listen 8085

###