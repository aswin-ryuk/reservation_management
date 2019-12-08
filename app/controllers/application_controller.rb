class ApplicationController < ActionController::API
 include ActionController::HttpAuthentication::Basic::ControllerMethods
 include ActionController::HttpAuthentication::Token::ControllerMethods
 #http_basic_authenticate_with name: "admin", password: "test"
 #before_action :restrict_access

private

def restrict_access
  authenticate_or_request_with_http_token do |token, options|
    ApiKey.where(access_token: token).exists?
  end
end

end