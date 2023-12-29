class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  def on_jwt_dispatch(token, payload)
    puts token
  end

  def jwt_payload
    super.merge({ email: })
  end
end
