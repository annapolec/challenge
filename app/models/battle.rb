class Battle < ActiveRecord::Base
  has_many :battle_members
  enum mode: [ :for_users, :for_group ]
end