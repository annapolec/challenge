class BattleDecorator < Draper::Decorator
  delegate_all

  def member_type
    object.mode == "for_users" ? "User" : "Group"
  end

  def label_method
    object.mode == "for_users" ? :email : :name
  end

  def executor_id(current_user)
    object.mode == "for_users" ? current_user.id : current_user.groups.where(id: BattleMember.where(battle_id: object.id, member_type: "Group").pluck(:member_id)).take.id
  end
end