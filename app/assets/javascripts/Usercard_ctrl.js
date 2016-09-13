(function() {
  angular.module('app').controller('usercardCtrl', function($scope) {
    $scope.message = "hello";
  });
})();

angular.module('app').controller('peopleCtrl', function($scope, $http) {
  $scope.setup = function() {
    $http.get('/api/v1/people.json').then(function(response) {
      $scope.people = response.data;
    });
  };
}