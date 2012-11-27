class HomeController < ApplicationController

	#layout 'home'

	def index
	end

	def enviar_feedback

		nome = Home.find(params[:nome])
		email = Home.find(params[:email])
		msg = Home.find(params[:mensagem])

		FeedbackMailer.feedback(nome,email,msg).deliver
	end
end
