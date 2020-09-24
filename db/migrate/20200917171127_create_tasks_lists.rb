class CreateTasksLists < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks_lists do |t|
      t.references :task, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
