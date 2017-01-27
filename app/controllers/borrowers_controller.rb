class BorrowersController < ApplicationController
  def index
      if params[:id].to_i != session[:user_id] || session[:label] != 'borrower'
          redirect_to '/'
          return
      else
          @user = Borrower.find(session[:user_id])
          @lenders = @user.lenders
      end
  end
end
