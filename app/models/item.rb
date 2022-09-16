class Item < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :photo, presence: true
  validates :range, presence: true
end
