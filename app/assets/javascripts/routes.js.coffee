@langunator = angular.module('langunator', ['ngTable', 'ngRoute', 'langunatorServices', 'Translation'])

@langunator.config ['$routeProvider', ($routeProvider)->
  $routeProvider
  .when '/ask',
    templateUrl: 'translations/ask.html'
    controller: 'AskController'
  .when '/translations',
    templateUrl: 'translations.html',
    controller: 'TranslationsController'
  .otherwise
      redirectTo: '/translations'
]
