class LoansController < ApplicationController
  def new
    @loan = Loan.new
  end

  def create
  end
end
