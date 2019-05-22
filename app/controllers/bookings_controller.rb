class BookingsController < ApplicationController
  def loans
    @user = current_user
    @loans = Loan.where(@user == :user)
  end

  def lendings
    @user = current_user
    @mangas = Manga.where(@user.id == :user_id)
  end
end
