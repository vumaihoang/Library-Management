class PublishersController < ApplicationController
  def show
    @publisher = Publisher.find_by id: params[:id]
  end
end
