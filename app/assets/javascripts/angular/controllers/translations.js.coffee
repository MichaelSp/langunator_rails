
paginated = (data, params)->
  data.slice((params.page() - 1) * params.count(), params.page() * params.count())

ordered = (data, params, $filter)->
  if params.sorting()
    $filter("orderBy")(data, params.orderBy())
  else
    data

filtered = (data, query, $filter)->
  if query
    $filter('filter')(data, query)
  else
    data

@TranslationsController = ($scope, $filter, $http, ngTableParams)->
  $scope.title = 'YEAH'
  $scope.storage = []

  $http.get('./translations.json').success (jsonData) ->
    $scope.storage = jsonData
    $scope.tableParams = new ngTableParams {
        page: 1 # show first page
        count: 10 # count per page
        sorting:
          name: "asc" # initial sorting
      }, {
        total: 0
        getData: ($defer, params) ->
            # use build-in angular filter
            data = filtered($scope.storage, $scope.filter, $filter)
            data = ordered(data, params, $filter)
            $defer.resolve paginated(data, params)
      }
    $scope.$watch "filter.$", ()=>
      $scope.tableParams.reload()
      $scope.tableParams.page(1)