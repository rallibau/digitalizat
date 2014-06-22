/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function obtenerMenuController($scope, $http) {
    $http({method: 'GET', url: '/digitalizatWebSite/view/getUserMenu.server'}).
            success(function(data, status, headers, config) {
                $scope.resources = data;
            }).
            error(function(data, status, headers, config) {

            });


}


