class MangasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @mangas = Manga.all
  end

  def show
  end

  def new
    @manga = Manga.new
  end

  def create
    @manga = Manga.new(manga_params)
    @manga.user = current_user
    if @manga.save
      redirect_to manga_path(@manga)
    else
      render :new
    end
  end

  def manga_params
    params.require(:manga).permit(:photo, :user_id)
  end
end
