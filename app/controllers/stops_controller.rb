class StopsController < ApplicationController
  skip_after_action :verify_authorized, only: [:create]

  def create
    raise
  end
end
