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

primary = PrimaryItemList.create!(
  primary_item: 'test',
  user_id: user.id
)

Spend.create!(
  content: 'パン',
  price: '123456',
  user_id: user.id,
  primary_item_list_id: primary.id
)

30.times do |n|
  Spend.create!(
    content: (n + 1).to_s,
    price: (n + 1000).to_s,
    user_id: user.id,
    primary_item_list_id: primary.id
  )
end
