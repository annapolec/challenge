class User < ApplicationRecord
  has_many :battle_members, as: :member
  has_many :battles, through: :battle_members
  has_many :groups, through: :group_users
  has_many :group_users

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
