class User < ApplicationRecord
  enum role: [:user, :admin]

  after_create_commit do |user|
    Users::SetDefaults.new.call(user.id)
  end

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable, :recoverable
  devise :database_authenticatable, :registerable, :rememberable, :validatable, :confirmable

  has_many :tasks, dependent: :destroy
  has_many :lists, dependent: :destroy

  validates :username, presence: true, length: { maximum: 30 }
end
