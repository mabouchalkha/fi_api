class FoodinspectorsController < ApplicationController
  def index
     render status: :ok,
        json: {
          error: "root of Food Inspectors"
        }
  end
end
