'use strict'

angular.module('sheamusApp')
  .directive('newThingForm', (Restangular, $log) ->
    templateUrl: 'partials/newThingForm'
    restrict: 'E'
    link: (scope, element, attrs) ->
      things = Restangular.all('awesomeThings')
      scope.submit = ->
        things.post(scope.newThing).then ((newThing) ->
          if scope.awesomeThings
            scope.awesomeThings.push(newThing)
          scope.newThing = {}
        ), (error) ->
          $log.error "Couldn't create this thing."
          $log.error error
  )
