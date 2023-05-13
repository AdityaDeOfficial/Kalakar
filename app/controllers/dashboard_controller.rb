class DashboardController < ApplicationController
  def index
    # #display bookmark belongs to user show 5 ? to see more go to my bookmark.all page
    # @bookmarks = current_user.bookmarks #works as an array

    #display manga belongs to user show 10? to see more go to my manga.all page
    @mangas = current_user.mangas

    @favorited_mangas = current_user.all_favorited
  end
end
