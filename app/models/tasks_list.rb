class TasksList < ApplicationRecord
  belongs_to :task
  belongs_to :list

  #задача может иметь лишь 1 список (unsorted or 1 of users lists)
  validates_uniqueness_of :task
end
