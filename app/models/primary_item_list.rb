# == Schema Information
#
# Table name: primary_item_lists
#
#  id                         :bigint           not null, primary key
#  initial_flag(初期値の判定) :boolean          default(FALSE), not null
#  primary_item(大項目)       :string           not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  user_id(userと紐づけ)      :integer          not null
#
class PrimaryItemList < ApplicationRecord
  validates :user_id, presence: true
  validates :primary_item, presence: true

  has_many :spends
  belongs_to :user

  # 初期値とユーザー追加のデータ取得
  def self.initial_and_useroriginal(user_id)
    where('user_id = ? or initial_value = ?', user_id, true).order(:id)
  end
end
