class List < ApplicationRecord
  belongs_to :user
  has_many :tasks_lists, dependent: :destroy
  has_many :tasks, through: :tasks_lists

  validates :name, presence: true, length: { maximum: 50 }
end
