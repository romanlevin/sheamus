'use strict'

###
List all awesome things
###
angular.module('sheamusApp')
  .directive 'awesomeThingsList', ->
    restrict: 'E'
    templateUrl: 'partials/awesomeThingsList'
    controller: ($scope, Restangular, $log) ->
      Restangular.all('awesomeThings').getList().then (awesomeThings) ->
        $scope.awesomeThings = awesomeThings

      $scope.removeThing = (thing) ->
        thing.remove().then (->
          _.pull($scope.awesomeThings, thing)
        ), ->
          $log.error "Couldn't remove thing #{thing.name}"
  
