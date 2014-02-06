'use strict'

describe 'Directive: thingsListItem', () ->

  # load the directive's module
  beforeEach module 'sheamusApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<things-list-item></things-list-item>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the thingsListItem directive'
