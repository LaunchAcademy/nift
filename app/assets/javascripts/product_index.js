// isotope stuff
$(window).load(function() {
  var $container = $('#productContainer');

  $container.isotope({
    itemSelector: '.product_image',
    layoutMode: 'masonry',
    masonry: {
      columnWidth: 50
    },
  });

  // display more text when product title is clicked
  $('.description').on('click', function(event) {
    event.preventDefault();
    $(this).toggleClass('show-description');
  });
});
