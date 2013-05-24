jQuery(document).ready(function() {

	//add class para os fields com erros
	$('.field_with_errors').addClass('control-group error');

	$('.alert-success, .alert-error').fadeOut(3500);

	//add class para o notice de sucesso
	$("#notice").addClass('alert alert-success');

	$("img[rel]").overlay();

	$('.typeahead').typeahead();

	$('.datatable').dataTable({
		"sPaginationType": "bootstrap",

    	"bLengthChange" : false,

    	"iDisplayLength" : 3,

	    "oLanguage": {

	        "sInfo": "Mostrando registros de _START_ a _END_ de um total de _TOTAL_",
	        "sInfoEmpty": "Nenhum registro para exibir",

	        "sSearch" : "Pesquisar",

	        "sInfoFiltered" : "",

	        "sZeroRecords": "Nenhum registro cadastrado"
	    }
	});

});

