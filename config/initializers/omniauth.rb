OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1083481781735001', 'a3d4f2dcf87e326b662ddc693325abde'
end
