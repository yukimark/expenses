# == Schema Information
#
# Table name: spends
#
#  id                                                      :bigint           not null, primary key
#  content(内容)                                           :string
#  deleted_at(論理削除用)                                  :datetime
#  memo(メモ)                                              :text
#  price(金額)                                             :integer          not null
#  primary_item(大項目)                                    :string
#  secondary_item(中項目)                                  :string
#  created_at                                              :datetime         not null
#  updated_at                                              :datetime         not null
#  primary_item_list_id(primary_item_listテーブルと紐づけ) :bigint
#  user_id(userテーブルと紐づけ)                           :bigint
#
# Indexes
#
#  index_spends_on_primary_item_list_id  (primary_item_list_id)
#  index_spends_on_user_id               (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Spend < ApplicationRecord
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 999999999999 }
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :primary_item_list

  # acts_as_paranoid
end
