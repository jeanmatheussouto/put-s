OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['347227862067152'], ENV['af279161146060d06d449ef5d85a0c08']
end