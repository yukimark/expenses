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
require 'rails_helper'

RSpec.describe PrimaryItemList, type: :model do
  pending "add some examples to (or delete) #{ __FILE__ }"
end
