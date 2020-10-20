class ChangeListsAssociations < ActiveRecord::Migration[6.0]
  def change
    drop_table(:tasks_lists)
  end

end
