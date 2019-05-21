class LoansController < ApplicationController
  def new
  end

  def create
    @loan = Loan.new(loan_params)
    @loan.user = current_user
    @loan.manga = Manga.find(params[:id])
  end

  private

  def loan_params
    params.require(:loan).permit(:loan_duration)
  end
end
