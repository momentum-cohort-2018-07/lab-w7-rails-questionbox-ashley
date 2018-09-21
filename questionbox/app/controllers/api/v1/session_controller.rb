class Api::V1::SessionsController < Api::V1::BaseController
    def create
      user = User.find_by_username(params[:username])
  
      if user && user.authenticate(params[:password])
        render json: { token: user.api_token }
      else
        render json: { error: "Invalid" }, status: :unauthorized
      end
    end

end