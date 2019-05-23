class LoansController < ApplicationController
  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params)
    @loan.user = current_user
    @manga = Manga.find(params[:manga_id])
    @loan.manga = @manga
    if @loan.save
      @manga.loan_state = true
      @manga.save
      redirect_to users_loans_path
    else
      redirect_to manga_path(@loan.manga)
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:started_at)
  end
end
