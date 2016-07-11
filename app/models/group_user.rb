class GroupUser < ActiveRecord::Base
  validates :group_id, :user_id, presence: true
end