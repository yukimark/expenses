class RenameBItemColumnToSpends < ActiveRecord::Migration[6.1]
  def change
    rename_column :spends, :b_item, :primary_item
    rename_column :spends, :c_item, :secondary_item
  end
end
