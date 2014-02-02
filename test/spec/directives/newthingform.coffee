'use strict'

describe 'Directive: newThingForm', () ->

  # load the directive's module
  beforeEach module 'sheamusApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<new-thing-form></new-thing-form>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the newThingForm directive'
