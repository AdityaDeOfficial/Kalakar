class MangaReviewsController < ApplicationController
  before_action :set_manga
  before_action :set_manga_review, only: [:update, :destroy]

  def create
    @manga_review = @manga.manga_reviews.build(manga_review_params)
    @manga_review.user = current_user # Assumes you have a method to get the current user

    if @manga_review.save
      flash[:notice] = "Review successfully created."
      redirect_to @manga
    else
      flash[:alert] = "Error creating review. Please try again."
      render "mangas/show"
    end
  end

  def update
    if @manga_review.update(manga_review_params)
      flash[:notice] = "Review successfully updated."
      redirect_to @manga
    else
      flash[:alert] = "Error updating review. Please try again."
      render "mangas/show"
    end
  end

  def destroy
    @manga_review.destroy
    flash[:notice] = "Review successfully deleted."
    redirect_to @manga
  end

  private

  def set_manga
    @manga = Manga.find(params[:manga_id])
  end

  def set_review
    @manga_review = @manga.manga_reviews.find(params[:id])
  end

  def manga_review_params
    params.require(:manga_review).permit(:content, :rating)
  end
end
