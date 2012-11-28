class FeedbackMailer < ActionMailer::Base
  default from: "jeanmatheussouto@gmail.com"

  def feedback(nome,email,msg)
  	@nome = nome
  	@email = email
  	@msg = msg

  	mail(:to => "jeanmatheussouto@gmail.com", :subject => "Feedback/Contato", :from => @email)
  end
end
