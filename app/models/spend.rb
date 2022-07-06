# == Schema Information
#
# Table name: spends
#
#  id                                              :bigint           not null, primary key
#  content(内容)                                   :string
#  price(金額)                                     :integer          not null
#  created_at                                      :datetime         not null
#  updated_at                                      :datetime         not null
#  primary_item_list_id(primary_item_listと紐づけ) :integer          not null
#  user_id(userと紐づけ)                           :integer          not null
#
class Spend < ApplicationRecord
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 999999999 }
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :primary_item_list
end
