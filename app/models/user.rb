class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable,
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  
  has_many :tasks, dependent: :destroy
  has_many :lists, dependent: :destroy

  validates :username, presence: true, length: { maximum: 30 }
end
