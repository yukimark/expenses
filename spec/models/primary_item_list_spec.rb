# == Schema Information
#
# Table name: primary_item_lists
#
#  id                         :bigint           not null, primary key
#  initial_flag(初期値の判定) :boolean          default(FALSE), not null
#  name(大項目)               :string           not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  user_id(userと紐づけ)      :integer
#
# Indexes
#
#  index_primary_item_lists_on_name_and_user_id  (name,user_id) UNIQUE
#
require 'rails_helper'

RSpec.describe PrimaryItemList, type: :model do
  pending "add some examples to (or delete) #{ __FILE__ }"
end
