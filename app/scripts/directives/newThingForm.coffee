'use strict'

angular.module('sheamusApp')
  .directive('newThingForm', (Restangular, $log) ->
    templateUrl: 'partials/newThingForm'
    restrict: 'E'
    link: (scope, element, attrs) ->
      things = Restangular.all('things')
      scope.submit = ->
        things.post(scope.thing).then ((newThing) ->
          if scope.things
            scope.things.push(newThing)
          scope.thing = {}
        ), (error) ->
          $log.error "Couldn't create this thing."
          $log.error error
  )
