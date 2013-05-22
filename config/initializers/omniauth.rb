OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end