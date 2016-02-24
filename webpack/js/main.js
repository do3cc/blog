require('shariff/build/shariff.min.css');
require('font-awesome/scss/font-awesome.scss');
var Shariff = require('shariff');
var $ = require('jquery');
$(function() {
    var buttonsContainer = $('.shariff');
    console.log(buttonsContainer);
    new Shariff(buttonsContainer, {
        orientation: 'horizontal',
        twitterVia: 'do3cc',
        services: ['twitter', 'facebook', 'googleplus', 'reddit', 'info']
    });
});
