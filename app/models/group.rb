class Group < ActiveRecord::Base
  has_many :battle_members, as: :member
  has_many :battles, through: :battle_members
  
  validates :name, presence: true
end