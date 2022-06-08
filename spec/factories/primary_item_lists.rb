# == Schema Information
#
# Table name: primary_item_lists
#
#  id                            :bigint           not null, primary key
#  initial_value(初期値ならtrue) :boolean          default(FALSE), not null
#  primary_item(大項目)          :string           not null
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  user_id(userと紐づけ)         :integer
#
FactoryBot.define do
  factory :primary_item_list do
    primary_item { 'MyString' }
    user_id { 1 }
  end
end
