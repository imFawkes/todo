class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { scope: :user, case_sensitive: false }
end
