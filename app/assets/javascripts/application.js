// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
 //= require bootstrap
//= require_tree .
//= require_tree ./lib

/*global $*/
/*

NOW AS A SUPER EASY TO USE PLUGIN:
http://panels.scotch.io

*/


$(function() {

  var special = ['reveal', 'top', 'boring', 'perspective', 'extra-pop'];

  // Toggle Nav on Click
  $('.hearts a').click(function() {

    var transitionClass = $(this).data('transition');

    if ($.inArray(transitionClass, special) > -1) {
      $('body').removeClass();
      $('body').addClass(transitionClass);
    } else {
      $('body').removeClass();
      $('#site-canvas').removeClass();
      $('#site-canvas').addClass(transitionClass);
    }

    $('#site-wrapper').toggleClass('show-nav');

    return false;

  });

});

var datas = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  // `states` is an array of state names defined in "The Basics"
  local: ['one', 'two', 'three']
});

$(document).ready(function() {
  console.log($(".search-input"))
  $(".search-input").typeahead({
    minLength: 1,
    highlight: true,
    hint: true
  },
  {
    name: 'my-dataset',
    source: datas
  });
});

