class Api::V1::UsersController < ApplicationController
  def signup
    email = params[:email]
    # unless email =~ /\A[^@\s]+@[^@\s]+\.[a-zA-Z]+\z/
    unless email =~ URI::MailTo::EMAIL_REGEXP
      render json: {
        error: 'Email is not in right format'
      }, status: :unprocessable_entity
      return
    end

    user = User.new(user_params)

    if user.save
      head :created
    else
      render json: {
        error: "Can't sign up, already signed up before"
      }, status: :unprocessable_entity
    end

  end


  private
  def user_params
    params.require(:user).permit(:firstName, :lastName, :email, :password, :country)
  end


end
