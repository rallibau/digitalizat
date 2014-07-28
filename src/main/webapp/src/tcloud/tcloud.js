angular.module('tcloud', [
    'tcloud.platform',
    'tcloud.tdoc',
    'ui.router'
])

        .config(function myAppConfig($stateProvider, $urlRouterProvider) {
            $urlRouterProvider.otherwise('/signin');
        })

        .run(function run() {
        })

        .controller('AppCtrl', function AppCtrl($scope,$rootScope, $http, $location) {
            //$scope.mail = "ningno";
            $scope.obtenerMenu = function() {
                $http({method: 'GET', url: '/tcloud/view/getUserMenu.server'}).
                        success(function(data, status, headers, config) {
                            $rootScope.resources = data;
                        }).
                        error(function(data, status, headers, config) {
                            //alert("fallo al obtener el menu");
                        });

            };
            $scope.doLogin = function() {
                if ($scope.user !== "" && $scope.pass !== "") {
                    $http({method: 'GET', url: 'server/doLogin?user=' + $scope.user + "&pwd=" + $scope.pass}).
                            success(function(data, status, headers, config) {
                                $rootScope.mail = data.email;
                                $scope.obtenerMenu();
                                $location.path("/home");
                            }).
                            error(function(data, status, headers, config) {
                                alert("El usuario o la contraseña no son correctos");
                            });

                }
            };
            $scope.doClose = function() {
                $http({method: 'GET', url: 'server/doLoginClose'}).
                        success(function(data, status, headers, config) {
                            $scope.obtenerMenu();
                            $location.path("/signin");
                        }).
                        error(function(data, status, headers, config) {
                            alert("error al cerrar sesion");
                        });

            }
            $scope.$on('$stateChangeSuccess', function(event, toState, toParams, fromState, fromParams) {
                if (angular.isDefined(toState.data.pageTitle)) {
                    $scope.pageTitle = toState.data.pageTitle + ' | tcloud';
                }
            });

        });

