//This approach needed to deal with turbolinks.
$(window).bind('page:change', function() {
	init_list_selectors();
});

function init_list_selectors() {
	$('.selectable').on('click', function(e) {
		var target = $(e.target).closest('.selectable');
		if (target.hasClass('selected')) {
			target.removeClass('selected');
		} else {
			target.addClass('selected');
		}
	});
}
/*
   $(document).ready(function() {
   $('#select_all').click(function() {
   if (this.checked) {
   $(':checkbox').each(function() {
   this.checked = true;
   });
   } else {
   $(':checkbox').each(function() {
   this.checked = false;
   });
   }
   });
   });
   */
