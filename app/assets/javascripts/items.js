//This approach needed to deal with turbolinks.
$(window).bind('page:change', function() {
	init_page();
});

function init_page() {
	$('.selectable').on('click', function(e) {
		if ($(e.target).parent().hasClass('selected')) {
			$(e.target).parent().removeClass('selected');
		} else {
			$(e.target).parent().addClass('selected');
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
