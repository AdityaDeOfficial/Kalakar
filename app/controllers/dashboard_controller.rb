class DashboardController < ApplicationController
  def index
    @mangas = current_user.mangas
    @favorited_mangas = current_user.all_favorited
  end
end
