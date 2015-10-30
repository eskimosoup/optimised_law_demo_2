/*
 * Example usage:
 * <a href="#div-to-go-to" data-container="#id" data-class="hidden" data-return="false">Toggle .hidden on #id and stop</a>
 *
 * Alternatively:
 * <a href="#div-to-go-to" data-container=".links" data-class="hidden" data-return="true">Toggle .hidden on .links and scroll to #div-to-go-to</a>
 */
$(document).on("click", ".toggle-class", function(e) {
  var toggleContainer = $(this).attr('data-container');
  var toggleClass     = $(this).attr('data-class');
  var dataReturn      = $(this).attr('data-return');

  $(toggleContainer).toggleClass(toggleClass);

  if (dataReturn === 'false') {
    e.preventDefault();
  }
});

$(document).on("click", ".modal-toggle", function(e) {
  var toggleContainer = $(this).attr('data-container');
  var dataReturn      = $(this).attr('data-return');

  $(toggleContainer).fadeToggle(250);
  $('html').toggleClass('disable-overflow');

  if (dataReturn === 'false') {
    e.preventDefault();
  }
});

var toggleContainer;
$(document).on('click', '.content-navigation-link', function(e) {
  toggleContainer = $(this).attr('href');
  console.log(toggleContainer);
  var dataReturn = $(this).attr('data-return');
  $('.active').removeClass('active');
  $(this).addClass('active');

  $('.content-navigation-content:not(' + toggleContainer + ')').slideUp(500, function() {
    $(toggleContainer).slideDown(250);
  });

  e.preventDefault();
})
