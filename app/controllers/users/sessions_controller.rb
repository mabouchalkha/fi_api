class Users::SessionsController < DeviseController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:create]
  before_action :authenticate_user_from_token!, :only => [:destroy]
  respond_to :json

  def create
    resource = User.find_for_database_authentication(email: params[:user][:email]) 
    return failure unless resource
    return failure unless resource.valid_password?(params[:user][:password])
    render status: :ok,
      json: {
        success: true, info: "Logged in", data: {
          user: resource,
          auth_token: resource.authentication_token
        }
      }
  end

  # DELETE /users/sign_out
  def destroy
    return permission_denied unless params[:user][:id].to_s == @current_user.id.to_s
    resource = User.find_for_database_authentication(id: params[:user][:id]) 
    return failure unless resource
    resource.clear_authentication_token
    render status: :ok,
      json: {
        success: true, info: "Logged out"
      }
  end
  
  def failure 
    warden.custom_failure! 
    render status: :ok,
    json: {
      success: false, info: "Login failed", data: {}
    }
  end 

end

