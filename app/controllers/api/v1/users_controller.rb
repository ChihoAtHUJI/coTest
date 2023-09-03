class Api::V1::UsersController < ApplicationController
  def signup
    user = User.new(user_params)

    if user.save
      render json: user, status:200
    else
      render json: {
        error: "Can't sign in"
      }
    end

  end

  def signin
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      puts 'hello'
      token = generate_token(user.id)
      render json: user_json(user, token), status: 200
    else
      render json:{
        error: 'Invalid email or password'
      }, status: :unauthorized
    end

  end

  private
  def user_params
    params.permit(:firstName, :lastName, :email, :password, :country)
  end

  def generate_token(user_id)
    playload = {userId: user_id}
    JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
  end

  def user_json(user, token)
    {
      data:{
        id: user.id,
        type: 'users',
        attributes:{
          token: token,
          email: user.email,
          name: user.name,
          country: user.country,
          createdAt: user.created_at,
          updatedAt: user.updated_at
        }
      }
    }
  end
end
