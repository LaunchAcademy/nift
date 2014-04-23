$(document).ready(function() {
  $('.arrow').hide();

  // apply random color tint to image overlays
  var colors = ['#600','#060','#006','#660','#606','#066'];
  $('.overlay').each(function(){
    var color = colors[Math.floor(Math.random() * colors.length)];
    $(this).css('background-color',color);
  })

  // display details when product title is clicked
  $('.description').on('click', function(event) {
    event.preventDefault();
    $(this).toggleClass('show-description');
    $(this).find('.arrow').fadeToggle(250);
  });

  // remove tint and show arrow when hovering on an image
  $('.product_image').hover(function() {
    $(this).find('.overlay').toggleClass('tint');
    if(!$(this).find('.description').hasClass('show-description')) {
      $(this).find('.arrow').fadeToggle(0);
    };
  });
});

// isotope stuff
$(window).load(function() {
  var $container = $('#productContainer');

  $container.isotope({
    itemSelector: '.product_image',
    layoutMode: 'masonry',
    masonry: {
      columnWidth: 50,
    }
  });
});
