class ChangeDeafaultColumnFromLists < ActiveRecord::Migration[6.0]
  def change
    rename_column :lists, :isDefault, :is_default
  end
end
