class LendersController < ApplicationController
  def index
      if params[:id].to_i != session[:user_id] || session[:label] != 'lender'
          redirect_to '/'
          return
      else
          @user = Lender.find(session[:user_id])
          @borrowers = Borrower.all
          @beneficiaries = @user.borrowers
      end
  end

  def make_loan
      lender = Lender.find(session[:user_id])
      if lender.balance < params[:amount].to_i
          flash[:errors] = {:balance => ['You do not have sufficient funds for this loan']}
      elsif !Loan.where(lender:lender).where(borrower_id:params[:id]).first
          loan = Loan.create(borrower:Borrower.find(params[:id]), lender:lender, amount:params[:amount])
          flash[:errors] = loan.errors.messages
          if loan.errors.messages.empty?
              lender.withdraw(params[:amount])
          end
      else
          loan = Loan.where(lender:lender).where(borrower_id:params[:id]).first
          new_amount = loan.amount + params[:amount].to_i
          loan.update(amount:new_amount)
      end
      redirect_to "/lender/#{session[:user_id]}"
      return
  end
end
