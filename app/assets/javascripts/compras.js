jQuery(document).ready(function() {

	//add class para os fields com erros
	$('.field_with_errors').addClass('control-group error');

	$('.alert-success, .alert-error').fadeOut(3500);

	//add class para o notice de sucesso
	$("#notice").addClass('alert alert-success');

	$('.typeahead').typeahead();

});

