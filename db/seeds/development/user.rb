User.create!(
  email: 'example01@gmail.com',
  password: 'passpass',
  password_confirmation: 'passpass'
)

User.create!(
  email: 'example02@gmail.com',
  password: 'passpass',
  password_confirmation: 'passpass'
)

Spend.create!(
  primary_item: '食費',
  secondary_item: '朝ごはん',
  content: 'パン',
  price: '123456',
  memo: 'ああああああああああああああああtexttexttext',
  user_id: '1',
  primary_item_id: '1'
)

PrimaryItemList.create!(
  primary_item: '食費',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: '日用品',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: '趣味･娯楽',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: '交際費',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: '交通費',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: '衣服･美容',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: '健康･医療',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: '自動車',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: '教養･教育',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: '特別な支出',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: '現金･カード',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: '水道･光熱費',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: '通信費',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: '住宅',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: '税･社会保障',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: '保険',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: 'その他',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: '未分類',
  initial_value: 'true'
)

PrimaryItemList.create!(
  primary_item: 'test',
  user_id: '1'
)

100.times do |n|
  Spend.create!(
    primary_item: 'test',
    content: (n + 1).to_s,
    price: (n + 1).to_s,
    user_id: '1',
    primary_item_id: '19'
  )
end
