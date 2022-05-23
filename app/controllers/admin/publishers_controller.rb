class Admin::PublishersController < ApplicationController
	def new
		@publisher = Publisher.new
	end

	def create
		@publisher = Publisher.new(publisher_params)
		if @publisher.save
			flash[:success] = "Publisher successfully created"
			redirect_to root_path
		else
			flash[:error] = "Something went wrong"
			render "new"
		end
	end

	private

	def publisher_params
			params.require(:publisher).permit(:name, :address)
	end
end
