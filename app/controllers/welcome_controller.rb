class WelcomeController < ApplicationController
	 before_action :authenticate_user!

  def landing
  	@users = User.all
  end

  def index
  end

  def about
  end
end
