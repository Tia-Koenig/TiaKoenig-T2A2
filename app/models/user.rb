class User < ApplicationRecord
  after_create :set_user_role
  rolify
  has_many :cards, dependent: :destroy
  has_one :role
  # has_one :account
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
  #new user role
  def set_user_role
    self.add_role(:user)
  end
end
