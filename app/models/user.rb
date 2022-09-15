class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable, :recoverable, :rememberable, :validatable,
         jwt_revocation_strategy: JwtDenylist
end
