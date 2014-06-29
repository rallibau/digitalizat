/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function obtenerMenuController($scope, $http) {
    $('#topdiv').show();
    $http({method: 'GET', url: '/tcloud/view/getUserMenu.server'}).
            success(function(data, status, headers, config) {
                $scope.resources = data;
                $('#topdiv').hide();
            }).
            error(function(data, status, headers, config) {
                $('#topdiv').hide();
            });


}

function getAllOrgUsers($scope, $http) {
    $('#topdiv').show();
    $http({method: 'GET', url: '/tcloud/view/getUsersOrg.server'}).
            success(function(data, status, headers, config) {
                $scope.users = data;
                $('#topdiv').hide();
            }).
            error(function(data, status, headers, config) {
                $('#topdiv').hide();
            });
}


