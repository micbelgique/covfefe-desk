window.$ = window.jQuery = require('jquery')

require('bootstrap-sass')
require('react_ujs')
require('axios')

global.React    = require('react')
global.ReactDOM = require('react-dom')
global._        = require('lodash')

require('./components/main.es6')
