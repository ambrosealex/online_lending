class MainController < ApplicationController
  def login
  end

  def register
  end

  def login_user
    if Lender.find_by_email(params[:email])
        lender = Lender.find_by_email(params[:email])
        if lender.authenticate(params[:password])
            session[:user_id] = lender.id
            session[:label] = 'lender'
            redirect_to "/lender/#{session[:user_id]}"
        else
            flash[:errors] = {:login=> ['Incorrect password']}
            redirect_to '/'
        end
    elsif Borrower.find_by_email(params[:email])
        borrower = Borrower.find_by_email(params[:email])
        if borrower.authenticate(params[:password])
            session[:user_id]= borrower.id
            session[:label] = 'borrower'
            redirect_to "/borrower/#{session[:user_id]}"
        else
            flash[:errors] = {:login=> ['Incorrect password']}
            redirect_to '/'
        end
    else
        flash[:errors] = {:login=> ['Invalid email']}
        redirect_to '/'
    end
  end

  def create_lender
    lender = Lender.create(f_name: params[:f_name], l_name: params[:l_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirm], balance: params[:balance])
    flash[:errors] = lender.errors.messages
    if !lender.errors.messages.empty?
        redirect_to '/register'
        return
    else
        redirect_to '/'
        return
    end
  end

  def create_borrower
    borrower = Borrower.create(f_name: params[:f_name], l_name: params[:l_name], cause: params[:cause], description: params[:description], goal: params[:goal], email: params[:email], password: params[:password], password_confirmation: params[:password_confirm])
    flash[:errors] = borrower.errors.messages
    if !borrower.errors.messages.empty?
        redirect_to '/register'
        return
    else
        redirect_to '/'
        return
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end
end
