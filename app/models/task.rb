class Task < ApplicationRecord
  belongs_to :user
  has_many :subtasks, dependent: :destroy
  has_many :tasks_lists, dependent: :destroy
  has_many :lists, through: :tasks_lists

  validates :content, presence: true

end
