'use strict'

angular.module('sheamusApp')
  .directive('thingForm', (Restangular, $log) ->
    templateUrl: 'partials/thingForm'
    restrict: 'E'
    link: (scope, element, attrs) ->
      thing = Restangular.one('things', scope.thing._id)
      scope.submit = ->
        thing.put(scope.thing).then ((thing) ->
          scope.thing = thing
          scope.mode.edit = ''
        ), (error) ->
          $log.error "Couldn't edit this thing."
          $log.error error
  )
