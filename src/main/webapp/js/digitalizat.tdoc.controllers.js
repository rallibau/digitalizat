/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function seeFolderController($scope, $http) {
    $('#topdiv').show();
    $http({method: 'GET', url: 'getDocList.server'}).
            success(function(data, status, headers, config) {
                $scope.docs = data;
                $('#topdiv').hide();
            }).
            error(function(data, status, headers, config) {

            });


}


