# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to?(:json)
  include RackSessionsFix

  private

  def respond_with(current_user, _opts = {})
    if resource.persisted?
      render json: {
        status: {
          code: 200,
          message: 'Signed up successfully'
        },
        data: UserSerializer.new(current_user).serializable_hash[:data]
      }
    else
      render json: {
        details: {
          code: 422,
          message: "User couldn't be created successfully #{current_user.errors.full_messages.to_sentence}"
        }
      }, status: :unprocessable_entity
    end
  end
end
