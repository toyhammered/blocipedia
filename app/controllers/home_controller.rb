class HomeController < ApplicationController
  def index
    if current_user
      redirect_to wikis_path
    end
  end
end
