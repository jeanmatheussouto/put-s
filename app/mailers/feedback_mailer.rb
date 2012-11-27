class FeedbackMailer < ActionMailer::Base
  default from: "putscontato@gmail.com"

  def feedback(nome,email,msg)
  	@nome = nome
  	@email = email
  	@msg = msg

  	mail(:to => @email, :subject => "Feedback/Contato", :from => "putscontato@gmail.com")
  end
end
