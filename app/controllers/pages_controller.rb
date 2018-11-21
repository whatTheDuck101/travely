class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @user = current_user
    @stop = Stop.new
  end

  def dashboard

  end
end
