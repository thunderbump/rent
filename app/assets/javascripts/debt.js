//This approach needed to deal with turbolinks.
$(window).bind('page:change', function() {
	init_page();
});

function init_page() {
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
