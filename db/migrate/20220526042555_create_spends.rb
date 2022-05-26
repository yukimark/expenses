class CreateSpends < ActiveRecord::Migration[6.1]
  def change
    create_table :spends, comment: '支出を記録する' do |t|
      t.string :content, comment: '内容'
      t.integer :price, null: false, comment: '金額'
      t.string :b_item, comment: '大項目'
      t.string :c_item, comment: '中項目'
      t.text :memo, comment: 'メモ'
      t.datetime :deleted_at, comment: '論理削除用'
      t.integer :user_id, null: false, comment: 'ユーザーID'

      t.timestamps
    end
  end
end
