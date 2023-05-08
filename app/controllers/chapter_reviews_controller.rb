class ChapterReviewsController < ApplicationController
  before_action :set_chapter
  before_action :set_chapter_review, only: [:update, :destroy]

  def create
    @chapter_review = @chapter.chapter_reviews.build(chapter_review_params)
    @chapter_review.user = current_user # Assumes you have a method to get the current user

    if @chapter_review.save
      flash[:notice] = "Review successfully created."
      redirect_to manga_chapter_path(@chapter.manga, @chapter)
    else
      flash[:alert] = "Error creating review. Please try again."
      render "chapters/show"
    end
  end

  def update
    if @chapter_review.update(chapter_review_params)
      flash[:notice] = "Review successfully updated."
      redirect_to manga_chapter_path(@chapter.manga, @chapter)
    else
      flash[:alert] = "Error updating review. Please try again."
      render "chapters/show"
    end
  end

  def destroy
    @chapter_review.destroy
    flash[:notice] = "Review successfully deleted."
    redirect_to manga_chapter_path(@chapter.manga, @chapter)
  end

  private

  def set_chapter
    @chapter = Chapter.find(params[:chapter_id])
  end

  def set_chapter_review
    @chapter_review = @chapter.chapter_reviews.find(params[:id])
  end

  def chapter_review_params
    params.require(:chapter_review).permit(:content, :rating)
  end
end
