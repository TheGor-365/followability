class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  followability
  has_many :posts, dependent: :destroy
end
