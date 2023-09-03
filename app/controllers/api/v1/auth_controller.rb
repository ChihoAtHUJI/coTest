class Api::V1::AuthController < ApplicationController
  def signin
    user = User.find_by(email: params[:email])
    puts 'hello'


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

  def generate_token(user_id)
    payload = {userId: user_id}
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
