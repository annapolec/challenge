class RankingService
  def general
    ranking = Ranking.new
    User.all.each do |user|
      ranking.users_results[user.id] = points(user.id, "User")
    end     
    Group.all.each do |group|
      ranking.groups_results[group.id] = points(group.id, "Group")
    end     
    ranking
  end 

  def for_battle(battle_id)
    ranking = Ranking.new
    battle = Battle.find(battle_id)
    battle.battle_members.each do |battle_member|
      ranking.battle_results[battle_member.member_id] = points_in_battle(battle_id, battle_member.member_id, battle_member.member_type)
    end
    ranking
  end

  private

  def points(member_id, member_type)
    challenge_members = ChallengeMember.where(member_id: member_id, member_type: member_type)
    challenge_members.inject(0) do |sum, challenge_member|
        sum += challenge_member.challenge.points
    end
  end

  def points_in_battle(battle_id, member_id, member_type)
    challenge_members = ChallengeMember.where(member_id: member_id, challenge_id: Battle.find(battle_id).challenges.pluck(:id), member_type: member_type)
    challenge_members.inject(0) do |sum, challenge_member|
        sum += challenge_member.challenge.points
    end
  end
end