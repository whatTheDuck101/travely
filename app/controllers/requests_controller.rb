class RequestsController < ApplicationController
  def create

    request = Request.new
    authorize(request)

  end

  def update
    request = Request.find(params[:id])
    authorize(request)
  end
end
