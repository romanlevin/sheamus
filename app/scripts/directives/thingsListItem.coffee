'use strict'

angular.module('sheamusApp')
  .directive('thingsListItem', () ->
    templateUrl: 'partials/thingsListItem'
    restrict: 'E'
    replace: true
    link: (scope, element, attrs) ->
      scope.mode = {}
      scope.editThing = () ->
        scope.mode.edit = 'edit'
  )
