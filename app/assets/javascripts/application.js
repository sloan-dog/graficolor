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
//= require jquery2
//= require jquery_ujs
// = require turbolinks
//= require_tree .

//= require materialize-sprockets

// Get the clicked paints name

$(window).load(function() {

  var createPaintDiv = function(backgroundColor) {
      $('#paint_picks').append("<div class='picked_paint' style='background-color:" + backgroundColor +  "' data-attribute='candy'></div>")
  }

  paints_picked = []
  $('.grid').find('div').each(function() {

      $(this).on('click', function(){
          var paint_values = [$(this).attr('id'), $(this).css('background-color')]
          console.log(paint_values)

          if (paints_picked.length < 3) {
              paints_picked.unshift(paint_values)
              createPaintDiv(paint_values[1])
              // if $('.picked_paint').count == 1
              // $('.picked_paint').attr('data-attribute',1)
              // $(this).find('.tracker.name')
          } else if ((paints_picked.length > 2) && (paint_values[1] != paints_picked[0][1]) && (paint_values[1] != paints_picked[1][1]) && (paint_values[1] != paints_picked[2][1])) {
              paints_picked.pop()
              paints_picked.unshift(paint_values)
              choices = $('.picked_paint')
              choices.first().css('background-color',paints_picked[0][1])
              choices.first().next().css('background-color',paints_picked[1][1])
              choices.first().next().next().css('background-color',paints_picked[2][1])
              var sendThisToServer = [paints_picked[0][0], paints_picked[1][0], paints_picked[2][0]]
              // update hidden field with value of paints_picked
              $('#hidden_field').val(sendThisToServer);
              console.log(paints_picked);
          }

      });
  });

  // init Isotope
  // var $grid = $('.grid').isotope({
  //   itemSelector: '.grid-item',
  //   layoutMode: 'fitRows'
  // });
  // filter functions


  $(".button-collapse").sideNav();
  // $(".dropdown-button").dropdown();

});




