class Api::V1::UsersController < ApplicationController
  def signup
    puts params
    user = User.new(user_params)

    if user.save
      head :created
    else
      render json: {
        error: "Can't sign in"
      }, status: :unprocessable_entity
    end

  end


  private
  def user_params
    params.permit(:firstName, :lastName, :email, :password, :country)
  end

end
