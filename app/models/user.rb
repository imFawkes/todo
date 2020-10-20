class User < ApplicationRecord
  enum role: [:user, :admin]

  # after_initialize :set_default_role, :if => :new_record?
  before_save :set_default_role
  after_save :create_unsorted_list

  def set_default_role
    self.role ||= :user
  end

  def create_unsorted_list
    list = self.lists.new(name: 'Unsorted')
    list.save
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable,
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :tasks, dependent: :destroy
  has_many :lists, dependent: :destroy

  validates :username, presence: true, length: { maximum: 30 }
end
