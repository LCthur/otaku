class LoansController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params)
    @loan.user = current_user
    @manga = Manga.find(params[:manga_id])
    @loan.manga = @manga
    current_user.nil? ? redirect_to_sign_in : save_loan
  end

  def redirect_to_sign_in
    respond_to do |format|
      format.html { redirect_to new_user_session_path }
      format.js { render js: "window.location='#{new_user_session_path.to_s}'" }
    end
  end

  def redirect_to_loans_recap
    respond_to do |format|
      format.html { redirect_to users_loans_path }
      format.js { render js: "window.location='#{users_loans_path.to_s}'" }
    end
  end

  def redirect_to_show
    respond_to do |format|
      format.html { redirect_to manga_path(@loan.manga) }
      format.js # <-- idem
    end
  end

  def save_loan
    if @loan.save
      @manga.loan_state = true
      @manga.save
      redirect_to_loans_recap
    else
      redirect_to_show
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:started_at)
  end
end
