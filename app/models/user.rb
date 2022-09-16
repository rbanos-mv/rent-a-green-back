class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable, :recoverable, :rememberable, :validatable,
         jwt_revocation_strategy: JwtDenylist

  has_many :reservations
  has_many :items, through: :reservations

  validates :name, presence: true
end
