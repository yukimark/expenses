class AddPrimaryItemIdToSpends < ActiveRecord::Migration[6.1]
  def change
    add_column :spends, :primary_item_id, :integer, comment: 'primary_item変更時の一括更新用'
  end
end
