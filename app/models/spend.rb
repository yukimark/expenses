class Spend < ApplicationRecord
  validates :price, presence: true
  validates :user_id, presence: true

  acts_as_paranoid
end
