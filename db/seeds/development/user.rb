user1 = User.create!(
  email: 'example01@gmail.com',
  password: 'passpass',
  password_confirmation: 'passpass'
)

User.create!(
  email: 'example02@gmail.com',
  password: 'passpass',
  password_confirmation: 'passpass'
)

initial_primary_items = %w[食費 日用品 趣味･娯楽 交際費 交通費 衣服･美容 健康･医療 自動車 教養･教育 特別な支出 現金･カード 水道･光熱費 通信費 住宅 税･社会保障 保険 その他 未分類]
initial_primary_items.each do |initial_primary_item|
  PrimaryItemList.create!(name: initial_primary_item, initial_flag: true)
end

primary = PrimaryItemList.create!(
  name: 'test',
  user_id: user1.id
)

Spend.create!(
  content: 'パン',
  price: '123456',
  user_id: user1.id,
  primary_item_list_id: primary.id
)

30.times do |n|
  Spend.create!(
    content: (n + 1).to_s,
    price: (n + 1000).to_s,
    user_id: user1.id,
    primary_item_list_id: primary.id
  )
end
