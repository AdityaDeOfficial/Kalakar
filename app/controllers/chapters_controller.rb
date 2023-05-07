class ChaptersController < ApplicationController
  before_action :set_manga
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  def index
    @chapters = @manga.chapters
  end

  def show
  end

  def new
    @chapter = @manga.chapters.build
  end

  def edit
  end

  def create
    @chapter = @manga.chapters.build(chapter_params)

    if @chapter.save
      redirect_to [@manga, @chapter], notice: 'Chapter was successfully created.'
    else
      render :new
    end
  end

  def update
    if @chapter.update(chapter_params)
      redirect_to [@manga, @chapter], notice: 'Chapter was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @chapter.destroy
    redirect_to manga_chapters_url(@manga), notice: 'Chapter was successfully destroyed.'
  end

  private

  def set_manga
    @manga = Manga.find(params[:manga_id])
  end

  def set_chapter
    @chapter = @manga.chapters.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:chapter_title, :chapter_number, :manga_id, chapter_photos: [])
  end
end
