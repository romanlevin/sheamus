'use strict'

###
List all awesome things
###
angular.module('sheamusApp')
  .directive 'thingsList', ->
    restrict: 'E'
    templateUrl: 'partials/thingsList'
    controller: ($scope, Restangular, $log) ->
      Restangular.all('things').getList().then (things) ->
        $scope.things = things

      $scope.removeThing = (thing) ->
        thing.remove().then (->
          _.pull($scope.things, thing)
        ), (error)->
          $log.error "Couldn't remove thing #{thing.name}"
          $log.error error

