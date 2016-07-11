class Group < ActiveRecord::Base
  has_many :battle_members, as: :member
  has_many :battles, through: :battle_members
  has_many :users, through: :group_users
  has_many :group_users
  
  validates :name, presence: true
end