class LoansController < ApplicationController
  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params)
    @loan.user = current_user
    @loan.manga = Manga.find(params[:manga_id])
    if @loan.save
      respond_to do |format|
        format.html { redirect_to users_loans_path }
        format.js { render js: "window.location='#{users_loans_path.to_sga}'" }
      end
    else
      respond_to do |format|
        format.html { redirect_to manga_path(@loan.manga) }
        format.js # <-- idem
      end
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:started_at)
  end
end
