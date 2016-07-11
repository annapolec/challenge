class Group < ActiveRecord::Base
  has_many :battle_members, as: :member
  has_many :battles, through: :battle_members
  has_many :users, through: :group_users
  has_many :group_users
  has_many :challenge_member, as: :member
  has_many :challenges, through: :challenge_members
  
  validates :name, presence: true

  def not_assigned_users
    User.where.not(id: self.group_users.pluck(:user_id))
  end
end