class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :lists, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 16}

  # один из способов defalut списков, скорее всего это удалится
  # after_create :add_default_lists

  # private
  # def add_default_lists
  #   self.lists.create(name: "not_completed")
  #   self.lists.create(name: "completed") 
  #   self.lists.create(name: "all")
  #   self.lists.create(name: "unsorted")
  # end
  
end
