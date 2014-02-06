'use strict'

describe 'Directive: thingForm', () ->

  # load the directive's module
  beforeEach module 'sheamusApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<thing-form></thing-form>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the thingForm directive'
