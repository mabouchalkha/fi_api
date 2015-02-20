class ContactsController < ApplicationController
  def create
	
	end

	private

	def contact_params
   	params.require(:contact).permit(:name)
  	end
end