class CreatePrimaryItemLists < ActiveRecord::Migration[6.1]
  def change
    create_table :primary_item_lists, comment: '出費の大項目リスト' do |t|
      t.string :primary_item, null: false, comment: '大項目'
      t.integer :user_id, null: false, comment: 'current_user_idが入る'
      t.boolean :initial_value, null: false, default: false, comment: '初期値ならtrue'

      t.timestamps
    end
  end
end
