# == Schema Information
#
# Table name: spends
#
#  id                     :bigint           not null, primary key
#  b_item(大項目)         :string
#  c_item(中項目)         :string
#  content(内容)          :string
#  deleted_at(論理削除用) :datetime
#  memo(メモ)             :text
#  price(金額)            :integer          not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id(ユーザーID)    :integer          not null
#
require 'rails_helper'

RSpec.describe Spend, type: :model do
  pending "add some examples to (or delete) #{ __FILE__ }"
end
