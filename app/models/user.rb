class User < ApplicationRecord
  has_many :battle_members, as: :member
  has_many :battles, through: :battle_members

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
