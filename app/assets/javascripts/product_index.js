$(document).ready(function() {
  $('.arrow').hide();

  // apply random color tint to image overlays
  var colors = ['#500','#050','#005','#550','#505','#055'];
  $('.overlay').each(function(){
    var color = colors[Math.floor(Math.random() * colors.length)];
    $(this).css('background-color',color);
  })

  // select sort field from hidden form
  // $('.sort_link').on('click', function() {
  //   var link = $(this).text();
  //   $("select[name='q[sort]'").find('option:contains('+link+')').attr('selected', true);
  //   $('.sort_query').submit();
  // });

  // display details when product title is clicked
  $('.description').on('click', function(event) {
    event.preventDefault();
    $(this).toggleClass('show-description');
    $(this).find('.arrow').fadeToggle(100);
  });

  // remove tint and show arrow when hovering on an image
  $('.product_image').hover(function() {
    $(this).find('.overlay').toggleClass('tint');
    $(this).find('.arrow').fadeToggle(200);
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
