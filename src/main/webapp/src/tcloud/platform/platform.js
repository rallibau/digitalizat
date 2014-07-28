/**
 * Each section of the site has its own module. It probably also has
 * submodules, though this boilerplate is too simple to demonstrate it. Within
 * `src/app/home`, however, could exist several additional folders representing
 * additional modules that would then be listed as dependencies of this one.
 * For example, a `note` section could have the submodules `note.create`,
 * `note.delete`, `note.edit`, etc.
 *
 * Regardless, so long as dependencies are managed correctly, the build process
 * will automatically take take of the rest.
 *
 * The dependencies block here is also where component dependencies should be
 * specified, as shown below.
 */
angular.module('tcloud.platform', [
    'ui.router',
    'ui.bootstrap'
]).config(function config($stateProvider) {
    $stateProvider.state('home', {
        url: '/home',
        views: {
            "main": {
                controller: 'platformController',
                templateUrl: 'src/tcloud/platform/view/home.html'
            }
        },
        data: {pageTitle: 'Home'}
    });
    $stateProvider.state('signin', {
        url: '/signin',
        views: {
            "main": {
                controller: 'platformController',
                templateUrl: 'src/tcloud/platform/view/signin.html'
            }
        },
        data: {pageTitle: 'Acceso'}
    });
}).controller('platformController', function platformController($scope, $http) {
    
});

function CollapseDemoCtrl($scope) {
    $scope.isCollapsed = true;
}


