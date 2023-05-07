class DashboardController < ApplicationController
  def index
    @mangas = current_user.mangas
  end
end
