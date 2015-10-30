// jQuery tooltip

// Inspired by http://www.mkyong.com/jquery/how-to-create-a-tooltips-with-jquery/
function changeTooltipPosition(event) {
  var tooltipX = event.pageX - 40;
  var tooltipY = event.pageY - 45;
  $('.tooltip').css({
    top: tooltipY,
    left: tooltipX
  }).removeClass('hide');
}

function showTooltip(event, elem) {
  changeTooltipPosition(event);
}

function hideTooltip() {
  $('.tooltip').addClass('hide');
}

$(function() {
  $('a[href="#invalid-link"]').addClass('invalid-link');
  $('input[type=submit]').addClass('invalid-link').attr('disabled');
  $('<div class="tooltip hide">This is not active because this website is a demo.</div>').appendTo('body');
});

$(document).on({
  mouseenter: function (e) {
    showTooltip(e, $(this));
  },
  mouseleave: function () {
    hideTooltip();
  }
}, '.invalid-link');
