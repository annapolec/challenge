class User < ApplicationRecord
  has_many :battle_members, as: :member
  has_many :battles, through: :battle_members
  has_many :groups, through: :group_users
  has_many :group_users
  has_many :challenge_members, as: :member
  has_many :challenges, through: :challenge_members

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def owned_battles
    Battle.where(owner: self)
  end

  def all_battles
    Battle.where(id: self.battle_members.pluck(:battle_id) + self.owned_battles.pluck(:id))
  end
end
