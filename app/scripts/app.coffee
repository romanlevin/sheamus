'use strict'

angular.module('sheamusApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'ngAnimate',
  'restangular'
])
  .config ($routeProvider, $locationProvider, $httpProvider, RestangularProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'partials/main'
        controller: 'MainCtrl'

      .when '/login',
        templateUrl: 'partials/login'
        controller: 'LoginCtrl'
      .when '/signup',
        templateUrl: 'partials/signup'
        controller: 'SignupCtrl'
      .when '/settings',
        templateUrl: 'partials/settings'
        controller: 'SettingsCtrl'
        authenticate: true
      .otherwise
        redirectTo: '/'

    $locationProvider.html5Mode true

    $httpProvider.interceptors.push ['$q', '$location', ($q, $location) ->
      responseError: (response) ->
        if response.status is 401 or response.status is 403
          $location.path '/login'
          $q.reject response
        else
          $q.reject response
    ]

    RestangularProvider.setBaseUrl('/api')
    RestangularProvider.setRestangularFields(
      id: '_id')
  .run ($rootScope, $location, Auth) ->

    # Redirect to login if route requires auth and you're not logged in
    $rootScope.$on '$routeChangeStart', (event, next) ->
      $location.path '/login'  if next.authenticate and not Auth.isLoggedIn()
