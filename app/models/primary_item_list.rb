# == Schema Information
#
# Table name: primary_item_lists
#
#  id                             :bigint           not null, primary key
#  primary_item(大項目)           :string           not null
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  user_id(current_user_idが入る) :integer          not null
#
class PrimaryItemList < ApplicationRecord
  # validates :user_id, presence: true
  validates :primary_item, presence: true

  # 初期値とユーザー追加のデータ取得
  def self.initial_and_useroriginal(user_id)
    where('user_id = ? or initial_value = ?', user_id, true).order(:id)
  end
end
