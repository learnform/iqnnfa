/* 
* @Author: lee
* @Date:   2016-01-10 23:52:03
* @Last Modified by:   anchen
* @Last Modified time: 2016-01-12 16:31:37
*/

'use strict';

define(['require',
        'angular',
        'angular-route',
        'angular-resource',
        'jquery',
        'app', 
        'router'

       ],function(require,angular){
            'use strict';
            require(['domReady!'],function(document){
                angular.bootstrap(document,['webapp']);
            });
        });