class CreatePrimaryItemLists < ActiveRecord::Migration[6.1]
  def change
    create_table :primary_item_lists, comment: '出費の大項目リスト' do |t|
      t.string :name, null: false, comment: '大項目'
      t.integer :user_id, comment: 'userと紐づけ'
      t.boolean :initial_flag, null: false, default: false, comment: '初期値の判定'
      t.integer :spend_target_value, null: false, default: 0, comment: '支出の目標値'

      t.timestamps
    end

    add_index :primary_item_lists, [:name, :user_id], unique: true
  end
end
