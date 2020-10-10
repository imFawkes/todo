class TasksList < ApplicationRecord
  belongs_to :task
  belongs_to :list

  # task can have only 1 custom list
  validates_uniqueness_of :task_id
end
