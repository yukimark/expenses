adminuser = User.create!(
  email: 'admin@gmail.com',
  password: 'passpass',
  password_confirmation: 'passpass',
  admin: 'true'
)

user = User.create!(
  email: 'example01@gmail.com',
  password: 'passpass',
  password_confirmation: 'passpass'
)

User.create!(
  email: 'example02@gmail.com',
  password: 'passpass',
  password_confirmation: 'passpass'
)

PrimaryItemList.create!(
  primary_item: '食費',
  initial_flag: 'true',
  user_id: adminuser.id
)

PrimaryItemList.create!(
  primary_item: '日用品',
  initial_flag: 'true',
  user_id: adminuser.id
)

PrimaryItemList.create!(
  primary_item: '趣味･娯楽',
  initial_flag: 'true',
  user_id: adminuser.id
)

PrimaryItemList.create!(
  primary_item: '交際費',
  initial_flag: 'true',
  user_id: adminuser.id
)

PrimaryItemList.create!(
  primary_item: '交通費',
  initial_flag: 'true',
  user_id: adminuser.id
)

PrimaryItemList.create!(
  primary_item: '衣服･美容',
  initial_flag: 'true',
  user_id: adminuser.id
)

PrimaryItemList.create!(
  primary_item: '健康･医療',
  initial_flag: 'true',
  user_id: adminuser.id
)

PrimaryItemList.create!(
  primary_item: '自動車',
  initial_flag: 'true',
  user_id: adminuser.id
)

PrimaryItemList.create!(
  primary_item: '教養･教育',
  initial_flag: 'true',
  user_id: adminuser.id
)

PrimaryItemList.create!(
  primary_item: '特別な支出',
  initial_flag: 'true',
  user_id: adminuser.id
)

PrimaryItemList.create!(
  primary_item: '現金･カード',
  initial_flag: 'true',
  user_id: adminuser.id
)

PrimaryItemList.create!(
  primary_item: '水道･光熱費',
  initial_flag: 'true',
  user_id: adminuser.id
)

PrimaryItemList.create!(
  primary_item: '通信費',
  initial_flag: 'true',
  user_id: adminuser.id
)

PrimaryItemList.create!(
  primary_item: '住宅',
  initial_flag: 'true',
  user_id: adminuser.id
)

PrimaryItemList.create!(
  primary_item: '税･社会保障',
  initial_flag: 'true',
  user_id: adminuser.id
)

PrimaryItemList.create!(
  primary_item: '保険',
  initial_flag: 'true',
  user_id: adminuser.id
)

PrimaryItemList.create!(
  primary_item: 'その他',
  initial_flag: 'true',
  user_id: adminuser.id
)

PrimaryItemList.create!(
  primary_item: '未分類',
  initial_flag: 'true',
  user_id: adminuser.id
)

primary = PrimaryItemList.create!(
  primary_item: 'test',
  user_id: user.id
)

Spend.create!(
  primary_item: '食費',
  content: 'パン',
  price: '123456',
  user_id: user.id,
  primary_item_list_id: primary.id
)

30.times do |n|
  Spend.create!(
    primary_item: primary.primary_item,
    content: (n + 1).to_s,
    price: (n + 1000).to_s,
    user_id: user.id,
    primary_item_list_id: primary.id
  )
end

