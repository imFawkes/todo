class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  
  has_many :tasks, dependent: :destroy
  has_many :lists, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 16}
end
