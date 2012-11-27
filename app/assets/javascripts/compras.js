jQuery(document).ready(function() {
	//$('.typeahead').typeahead();

	//add class para os fields com erros
	$('.field_with_errors').addClass('control-group error');


	//add class para o notice de sucesso
	$("#notice").addClass('alert alert-success');

	$("img[rel]").overlay();

	$('.typeahead').typeahead();

	$('.datatable').dataTable({
		"sPaginationType": "bootstrap"
	});
});

