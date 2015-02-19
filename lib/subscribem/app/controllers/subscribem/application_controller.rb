module Subscribem
  class ApplicationController < ::ApplicationController
    def authorize_owner
      unless owner?
        render status: :forbidden,
          json: { success: false, info: "You are not allowed to do that.", data: {} }
#         flash[:error] = ""
#         redirect_to root_path
      end
    end
  end
end
