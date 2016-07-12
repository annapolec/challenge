class BattleDecorator < Draper::Decorator
  delegate_all

  def member_type
    object.mode == "for_users" ? "User" : "Group"
  end

  def label_method
    object.mode == "for_users" ? :email : :name
  end
end