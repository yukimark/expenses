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
FactoryBot.define do
  factory :spend do
    content { 'テスト' }
    price { 180 }
    user
  end
end
