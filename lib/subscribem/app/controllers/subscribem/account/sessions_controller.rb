require_dependency "subscribem/application_controller"

module Subscribem
  class Account::SessionsController < Subscribem::ApplicationController
    def new
      @user = User.new
    end

    def create
      if env["warden"].authenticate(:scope => :user)
        render status: :ok,
          json: {
              success: true, info: "You are now signed in.", data: {
              user: @user,
            }
          }
#         flash[:success] = "You are now signed in."
#         redirect_to root_path
      else
        render status: :unprocessable_entity, json: { success: false, info: "Invalid email or password.", data: { } }
#         @user = User.new
#         flash[:error] = "Invalid email or password."
#         render :action => "new"
      end
    end
  end
end
