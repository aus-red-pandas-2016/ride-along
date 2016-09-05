module Authenticable
  def current_user
    @current_user ||= User.find_by_auth_token(request.headers["Authorization"])
  end
end
