$(document).on('ready page:load', function() {
	$('#search-form').submit(function(ev) {
			ev.preventDefault();
			var value = $('#search').val();

			$.ajax({
				url: "/products?search=" + value,
				type: 'GET',
				dataType: 'html',
			}).done(function(data){
					$('#products').html(data);
			});
	});
});