class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def me
    render json: {
      data: {
        user: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      }
    }
  end
end
