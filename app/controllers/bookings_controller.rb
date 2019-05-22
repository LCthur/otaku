class BookingsController < ApplicationController
  def loans
    @user = current_user
    @loans = Loan.where(:user == @user)
  end

  def lendings
  end
end
