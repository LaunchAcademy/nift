// display details when product title is clicked
  $('.description').on('click', function(event) {
    event.preventDefault();
    $(this).toggleClass('show-description');
  });
// });

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
});

// $container.isotope({sortBy: 'release_date'})
