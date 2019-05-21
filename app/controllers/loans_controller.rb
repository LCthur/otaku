class LoansController < ApplicationController

  def create
    @loan = Loan.new(loan_params)
    @loan.user = current_user
    @loan.manga = Manga.find(params[:id])
  end
end
