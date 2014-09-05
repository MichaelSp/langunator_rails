app = angular.module('langunator', ['ngResource'])

app.factory 'Translation', ['$resource',($resource)->
    $resource 'translations.json', {},
      isArray: true,
      method: 'GET'
]