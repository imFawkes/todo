class Task < ApplicationRecord
  belongs_to :user
  belongs_to :list, optional: true
  has_many :subtasks, dependent: :destroy

  validates :content, presence: true
end
