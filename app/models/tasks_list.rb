class TasksList < ApplicationRecord
  belongs_to :task
  belongs_to :list

  #task have to be included only 1 of users lists
  validates_uniqueness_of :task
end
