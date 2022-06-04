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
  user_id: '1'
)

PrimaryItemList.create!(
  primary_item: '食費',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: '日用品',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: '趣味･娯楽',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: '交際費',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: '交通費',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: '衣服･美容',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: '健康･医療',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: '自動車',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: '教養･教育',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: '特別な支出',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: '現金･カード',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: '水道･光熱費',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: '通信費',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: '住宅',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: '税･社会保障',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: '保険',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: 'その他',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: '未分類',
  user_id: '0'
)

PrimaryItemList.create!(
  primary_item: 'test',
  user_id: '1'
)
