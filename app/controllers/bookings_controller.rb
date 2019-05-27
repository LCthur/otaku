class BookingsController < ApplicationController
  def loans
    @user = current_user
    @loans = Loan.where(@user == :user)
  end

  def lendings
    @user = current_user
    # recuperation des mangas de l'utilisateur
    @mangas = Manga.where(user_id: @user)
    # pour chaque manga, definir la location
    @mangas.each do |manga|
      manga.loan = Loan.where(manga.id == :manga_id)
    end
  end
end
