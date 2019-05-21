class LoansController < ApplicationController

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new
    @loan.user = current_user
    @loan.manga = Manga.find(params[:manga_id])
    if @loan.save
      redirect_to root_path
    else
      redirect_to manga_path(@loan.manga)
    end
  end

  private

  def duration_calculator

  end
end
