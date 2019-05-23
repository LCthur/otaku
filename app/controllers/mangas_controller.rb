class MangasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @mangas = Manga.all
  end

  def show
    @manga = Manga.find(params[:id])
    @loan = Loan.new
    @owner = User.find(@manga.user_id)

    unless @owner.latitude.nil? && @owner.longitude.nil?
      @markers = 
        [{
          lat: @owner.latitude,
          lng: @owner.longitude
        }]
    end
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
    params.require(:manga).permit(:photo, :title, :photo_cache, :description, :author, :editor, :publication_date, :serie_name, :tome_number, :genre, :pages_number, :language)
  end
end
