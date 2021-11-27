require("shariff/dist/shariff.min.css");
require("@fortawesome/fontawesome-free/scss/fontawesome.scss");
var Shariff = require("shariff");
var $ = require("jquery");
$(function () {
  var buttonsContainer = $(".shariff");
  new Shariff(buttonsContainer, {
    orientation: "horizontal",
    twitterVia: "do3cc",
    services: ["twitter", "facebook", "googleplus", "reddit", "info"],
  });
});
