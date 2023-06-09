class MangasController < ApplicationController
  before_action :set_manga, only: [:show, :edit, :update, :destroy]

  def index
    if params[:tag]
      @mangas = Manga.tagged_with(params[:tag])
    # elsif params[:search].present?
    #   @mangas = Manga.search_by_title_and_tags(params[:search])
    #   render json: @mangas
    elsif params[:search].present?
      @mangas = Manga.search_by_title_and_tags(params[:search])
      # raise
      respond_to do |format|
        format.json { render json: @mangas }  # Render JSON response
        format.html # Render HTML template
      end
      # redirect_to params[:search]_path
    else
      @mangas = Manga.all
    end
  end

  def show
    @mangas = Manga.all
  end

  def new
    @manga = Manga.new
  end

  def edit
  end

  def create
    @manga = Manga.new(manga_params)
    @manga.user_id = current_user.id

    if @manga.save
      redirect_to @manga, notice: 'Manga was successfully created.'
    else
      render :new
    end
  end

  def update
    if @manga.update(manga_params)
      redirect_to @manga, notice: 'Manga was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @manga.destroy
      redirect_to dashboard_index_path, notice: 'Manga was successfully destroyed.'
    else
      redirect_to @manga, alert: 'Failed to destroy manga.'
    end
  end

  def favorite
    @manga = Manga.find(params[:id])
    current_user.favorite(@manga)
    redirect_to @manga, notice: 'Manga has been favorited.'
  end

  def unfavorite
    @manga = Manga.find(params[:id])
    current_user.unfavorite(@manga)
    redirect_to @manga, notice: 'Manga has been unfavorited.'
  end

  private

  def set_manga
    @manga = Manga.find(params[:id])
  end

  def manga_params
    params.require(:manga).permit(:manga_title, :author, :description, :cover_image, :tag_list)
  end
end
