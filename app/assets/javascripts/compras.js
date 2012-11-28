jQuery(document).ready(function() {
	//$('.typeahead').typeahead();

	//add class para os fields com erros
	$('.field_with_errors').addClass('control-group error');


	//add class para o notice de sucesso
	$("#notice").addClass('alert alert-success');

	$("img[rel]").overlay();

	$('.typeahead').typeahead();

	$('.datatable').dataTable({
		"sPaginationType": "bootstrap",

    	"bLengthChange" : false,

    	"iDisplayLength" : 7,

	    "oLanguage": {

	        "sInfo": "Mostrando registros de _START_ a _END_ de um total de _TOTAL_",
	        "sInfoEmpty": "Nenhum registro para exibir",

	        "sSearch" : "Pesquisar",

	        "sInfoFiltered" : "",

	        "sZeroRecords": "Nenhum registro cadastrado"
	    }
	});

	$(".notice").fadeOut(4000);

});

