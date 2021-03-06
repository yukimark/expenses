# == Schema Information
#
# Table name: primary_item_lists
#
#  id                               :bigint           not null, primary key
#  initial_flag(初期値の判定)       :boolean          default(FALSE), not null
#  name(大項目)                     :string           not null
#  spend_target_value(支出の目標値) :integer          default(0), not null
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  user_id(userと紐づけ)            :integer
#
# Indexes
#
#  index_primary_item_lists_on_name_and_user_id  (name,user_id) UNIQUE
#
class PrimaryItemList < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :initial_flag, inclusion: { in: [true, false] }
  validates :spend_target_value, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 999999999 }

  has_many :spends, dependent: :nullify
  belongs_to :user
end
