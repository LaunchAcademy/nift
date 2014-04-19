$(document).ready(function() {
  // apply random color tint to image overlays
  var colors = ['#f00','#0f0','#00f','#ff0','#f0f','#0ff'];
  $('.overlay').each(function(){
    var color = colors[Math.floor(Math.random() * colors.length)];
    $(this).css('background-color',color);
  })

  // select sort field from hidden form
  $('.sort_link').on('click', function() {
    var link = $(this).text();
    $("select[name='q[sort]'").find('option:contains('+link+')').attr('selected', true);
    $('.q').submit();
  });

  // display details when product title is clicked
  $('.description').on('click', function(event) {
    event.preventDefault();
    $(this).toggleClass('show-description');
  });

  // remove tint when hovering on an image
  $('.product_image').hover(function() {
    $(this).find('.overlay').toggleClass('tint');
  });
});

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
