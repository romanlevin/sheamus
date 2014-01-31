'use strict'

angular.module('sheamusApp')
  .factory 'Session', ($resource) ->
    $resource '/api/session/'
