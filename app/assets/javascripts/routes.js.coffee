@langunator = angular.module('langunator', ['ngTable', 'ngRoute'])

@langunator.config ['$routeProvider', ($routeProvider)->
  $routeProvider
    .when '/ask',
      templateUrl: 'translations/ask.html'
      controller: 'AskController'
    .when '/edit',
      templateUrl: 'translations.html',
      controller: 'TranslationsController'
    .otherwise
      redirectTo: '/edit'
]