class Review < ActiveRecord::Base

  belongs_to :product

  validates :rating, presence: true
  validates :product, presence: true
  validates :user, presence: true
end
