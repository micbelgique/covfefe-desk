window.$ = window.jQuery = require('jquery')

require('bootstrap-sass')
require('react_ujs')

global.axios = require('axios')
global.React    = require('react')
global.ReactDOM = require('react-dom')
global._        = require('lodash')
global.axios    = require('axios')
global.humps    = require('humps')
global.moment   = require('moment')
moment.locale('fr');

require('./components/main.es6')
