class MangasController < ApplicationController
  before_action :set_manga, only: [:show, :edit, :update, :destroy]

  def index
    @mangas = Manga.all
  end

  def show
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
    @manga.destroy
    redirect_to root_path, notice: 'Manga was successfully destroyed.'
  end

  private

  def set_manga
    @manga = Manga.find(params[:id])
  end

  def manga_params
    params.require(:manga).permit(:manga_title, :author, :description, :cover_image)
  end
end
