class User < ActiveRecord::Base
  validates :email, uniqueness: true
  has_many :participations
  has_many :themes, through: :participations
  has_many :expenses
end
