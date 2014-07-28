var tdoc = angular.module('tcloud.tdoc', [
    'ui.router',
    'placeholders',
    'ui.bootstrap',
    'ngGrid'
]);

tdoc.config(function config($stateProvider) {
    $stateProvider.state('tdoc', {
        url: '/tdoc',
        views: {
            "main": {
                //controller: 'AboutCtrl',
                //templateUrl: 'about/about.tpl.html',
                templateUrl: 'src/tcloud/tdoc/view/viewFolder.html'
            }
        },
        data: {pageTitle: 'Gestor documental'}
    });
});

tdoc.controller('gridDocController', function($scope, $rootScope, $http) {

    $scope.filterOptions = {
        filterText: "",
        useExternalFilter: true
    };
    $scope.totalServerItems = 0;
    $scope.pagingOptions = {
        pageSizes: [5, 10, 20],
        pageSize: 10,
        currentPage: 1
    };
    $scope.setPagingData = function(data, page, pageSize) {
        var pagedData = data.slice((page - 1) * pageSize, page * pageSize);
        $scope.myData = pagedData;
        $scope.totalServerItems = data.length;
        if (!$scope.$$phase) {
            $scope.$apply();
        }
    };
    $scope.getPagedDataAsync = function(pageSize, page, searchText) {
        setTimeout(function() {
            var data;
            $http.get('view/getDocList/' + 0 + "/").success(function(largeLoad) {
                $scope.setPagingData(largeLoad, page, pageSize);
            });

        }, 100);
    };

    $scope.getPagedDataAsync($scope.pagingOptions.pageSize, $scope.pagingOptions.currentPage);

    $scope.$watch('pagingOptions', function(newVal, oldVal) {
        if (newVal !== oldVal && newVal.currentPage !== oldVal.currentPage) {
            $scope.getPagedDataAsync($scope.pagingOptions.pageSize, $scope.pagingOptions.currentPage, $scope.filterOptions.filterText);
        }
    }, true);
    $scope.$watch('filterOptions', function(newVal, oldVal) {
        if (newVal !== oldVal) {
            $scope.getPagedDataAsync($scope.pagingOptions.pageSize, $scope.pagingOptions.currentPage, $scope.filterOptions.filterText);
        }
    }, true);

    $scope.gridOptions = {
        data: 'myData',
        enablePaging: true,
        showFooter: true,
        totalServerItems: 'totalServerItems',
        pagingOptions: $scope.pagingOptions,
        filterOptions: $scope.filterOptions,
        rowHeight: '40',
        multiSelect: false,
        columnDefs: [
            {field: 'imageCaption',
                width: '40px',
                displayName: 'Image',
                cellTemplate: '<img src="/tcloud/img/{{row.entity.mime}}" class="carpeta">'
            },
            {field: 'fileName',
                displayName: 'Nombre',
            }
        ],
        rowTemplate: '<div ng-dblclick="viewFile(row)" ng-style="{\'cursor\': row.cursor, \'z-index\': col.zIndex() }" ng-repeat="col in renderedColumns" ng-class="col.colIndex()" class="ngCell {{col.cellClass}}" ng-cell></div>',
    };
    $scope.viewFile = function(r) {
        //alert(r.entity.id);
        $rootScope.$emit("VIEW_FILE", r.entity.id,r.entity.fileName);
    };

    $rootScope.$on("UPDATE_GRID", function(event, message) {
        $scope.getPagedDataAsync($scope.pagingOptions.pageSize, $scope.pagingOptions.currentPage);
    });
});

var ModalDemoCtrl = function($scope, $rootScope, $modal, $log) {

    $rootScope.$on("VIEW_FILE", function(event, id,name) {
        $scope.viewFile(id,name);
    });

    $scope.openUploadFile = function(size) {

        $modal.open({
            templateUrl: 'src/tcloud/tdoc/view/subirDoc.html',
            controller: ModalInstanceCtrl,
            size: size,
            resolve: {
                idFile: function() {
                    return null;
                },
                name: function() {
                    return null;
                }
            }

        });


    };
    $scope.viewFile = function(idFile,name) {

        $modal.open({
            templateUrl: 'src/tcloud/tdoc/view/viewFile.html',
            controller: ModalInstanceCtrl,
            size: 'lg',
            resolve: {
                idFile: function() {
                    return idFile;
                },
                name: function() {
                    return name;
                }
            }
        });


    };

};

var ModalInstanceCtrl = function($scope, $rootScope, $modalInstance,idFile,name) {
    
    $scope.idFile = idFile;
    $scope.name = name;

    $scope.ok = function() {
        $modalInstance.close($scope.selected.item);
    };

    $scope.cancel = function() {
        $modalInstance.dismiss('cancel');
    };
    
    $scope.getIframeSrc = function(){
        return "web/viewer.html?file=/tcloud/server/obtenerFichero/"+$scope.idFile;
    };
    
    $rootScope.$on("UPDATE_GRID", function(event, message) {
        $scope.cancel();
    });
};

tdoc.controller('ModalDemoCtrl', ModalDemoCtrl);

tdoc.directive('fileModel', ['$parse', function($parse) {
        return {
            restrict: 'A',
            link: function(scope, element, attrs) {
                var model = $parse(attrs.fileModel);
                var modelSetter = model.assign;

                element.bind('change', function() {
                    scope.$apply(function() {
                        modelSetter(scope, element[0].files[0]);
                    });
                });
            }
        };
    }]);
tdoc.service('fileUpload', ['$http', '$rootScope', function($http, $rootScope) {
        this.uploadFileToUrl = function(file, uploadUrl) {
            var fd = new FormData();
            fd.append('file', file);
            $http.post(uploadUrl, fd, {
                transformRequest: angular.identity,
                headers: {'Content-Type': undefined}
            })
                    .success(function() {
                        //$scope.getPagedDataAsync($scope.pagingOptions.pageSize, $scope.pagingOptions.currentPage);
                    })
                    .error(function() {
                        //$scope.getPagedDataAsync($scope.pagingOptions.pageSize, $scope.pagingOptions.currentPage);
                        //$scope.cancel();
                        $rootScope.$emit("UPDATE_GRID", "updated");

                    });
        };
    }]);
tdoc.controller('submitToUpload', ['$scope', 'fileUpload', function($scope, fileUpload) {

        $scope.uploadFile = function() {
            var file = $scope.myFile;
            console.log('file is ' + JSON.stringify(file));
            var uploadUrl = "view/guardarFichero?idFolder=0";
            fileUpload.uploadFileToUrl(file, uploadUrl);
        };

    }]);


