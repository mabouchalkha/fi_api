class FoodinspectorsController < ApplicationController
  def index
     render status: :ok,
        json: {
          API Food Inspectors (App)
        }
  end
end
