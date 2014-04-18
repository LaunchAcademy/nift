// $(document).ready(function() {
//   var colors = [
//     '#f00',
//     '#0f0',
//     '#00f',
//     '#ff0',
//     '#f0f'
//   ];

//   $('.filter').each(function() {
//     var color = colors[Math.floor(Math.random()*colors.length)];
//     $(this).css('background', 'linear-gradient('+color+')');
//   });

//   $('.product_image').hover(function() {
//     $(this).toggleClass('filter');
//   });

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
