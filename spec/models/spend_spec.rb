# == Schema Information
#
# Table name: spends
#
#  id                                              :bigint           not null, primary key
#  content(内容)                                   :string
#  deleted_at(論理削除用)                          :datetime
#  memo(メモ)                                      :text
#  price(金額)                                     :integer          not null
#  primary_item(大項目)                            :string
#  secondary_item(中項目)                          :string
#  created_at                                      :datetime         not null
#  updated_at                                      :datetime         not null
#  primary_item_id(primary_item変更時の一括更新用) :integer
#  user_id(ユーザーID)                             :integer          not null
#
require 'rails_helper'

RSpec.describe Spend, type: :model do
  pending "add some examples to (or delete) #{ __FILE__ }"
end
