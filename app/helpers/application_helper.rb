module ApplicationHelper
	#Helper para mostrar erros de validações
	def mensagens_erro(model)
		if model.errors.any? 
			erros = "<div class='alert alert-error'>"
			erros += "<h4>#{pluralize(model.errors.count, "erro")}, encontrados:</h4>"
			erros += "<hr>"
			erros += "<ul>"
			
			model.errors.full_messages.each do |msg|
				erros += "<li> #{msg}</li>"
			end

			erros += "</ul> </div>"
		end
		raw erros  
	end

	#Helper para busca as ultimas 10 compras
	#para alimentar a sidebar
	def ultimas_compras
		return current_user.compras.limit(10).order("created_at DESC")
	end

	#helper para gerar uma modal para o show de uma compra
	def modal_show_compra(model)
		modal =  "<div class='modal hide fade' id='#{model.class}#{model.id}'>"
		modal += "<div class='modal-header'>"
		modal += "<button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>"
		modal += "<h3>#{model.class} - #{model.nome}</h3>"
		modal += '</div>'
		modal += "<div class='modal-body'>"
		modal += "<p><b>Nome:</b>#{model.nome}</p>"
		modal += "<p><b>Descricao:</b>#{model.descricao}</p>"
		modal += "</div>"
		modal += "</div>"

		raw modal
	end

	#helper para gerar uma modal para o show de uma compra
	def check_list(model)
		modal =  "<div class='modal hide fade content_tab2' id='check_#{model.nome}'>"
		modal += "<div class='modal-header'>"
		modal += "<button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>"
		modal += "<h3>CHECK LIST</h3>"
		modal += '</div>'
		modal += "<div class='modal-body'>"
		modal += "<ul class='checklist'>"
		model.produtos.each do |p|
			modal += "<li><input type='checkbox'/>#{p.nome}</li>"
		end
		modal += "</ul>"

		modal += "</div>"
		modal += "</div>"

		raw modal
	end

	def getsource
    	array = []
    	User.all.each do |u|
    		array << u.nome 
    	end
    	return array.to_json
  	end
end
