class AddColumnSpends < ActiveRecord::Migration[6.1]
  def change
    add_reference :spends, :user, foreign_key: true, comment: 'userテーブルと紐づけ'
    add_reference :spends, :primary_item_list, comment: 'primary_item_listテーブルと紐づけ'
  end
end
