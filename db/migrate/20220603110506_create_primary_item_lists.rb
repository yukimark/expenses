class CreatePrimaryItemLists < ActiveRecord::Migration[6.1]
  def change
    create_table :primary_item_lists, comment: '出費の大項目リスト' do |t|
      t.string :primary_item, null: false, comment: '大項目'
      t.integer :user_id, null: false, comment: 'userと紐づけ'
      t.boolean :initial_flag, null: false, default: false, comment: '初期値の判定'

      t.timestamps
    end
  end
end
