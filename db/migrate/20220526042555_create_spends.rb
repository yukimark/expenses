class CreateSpends < ActiveRecord::Migration[6.1]
  def change
    create_table :spends, comment: '支出を記録する' do |t|
      t.string :content, comment: '内容'
      t.integer :price, null: false, comment: '金額'
      t.integer :user_id, null: false, comment: 'userと紐づけ'
      t.integer :primary_item_list_id, null: false, comment: 'primary_item_listと紐づけ'

      t.timestamps
    end
  end
end
