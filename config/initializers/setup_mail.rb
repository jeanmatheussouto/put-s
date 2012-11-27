ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "localhost",  
  :user_name            => "putscontato",  
  :password             => "puts@123",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}  