class HomeController < ApplicationController

	def index
	end

	def enviar_feedback

		nome = params[:nome]
		email = params[:email]
		msg = params[:mensagem]

		FeedbackMailer.feedback(nome,email,msg).deliver

		redirect_to root_path
	end
end
