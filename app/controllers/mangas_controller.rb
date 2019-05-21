class MangasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @mangas = Manga.all
  end

  def show
    @manga = Manga.find(params[:id])
    @loan = Loan.new
  end

  def new
  end

  def create
  end
end
