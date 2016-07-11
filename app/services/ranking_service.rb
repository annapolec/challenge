class RankingService
  def general
    ranking = Ranking.new
    User.all.each do |user|
      ranking.results[user.id] = points(user.id)
    end      
    ranking
  end 

  def for_battle(battle_id)
    ranking = Ranking.new
    battle = Battle.find(battle_id)
    battle.battle_members.each do |battle_member|
      ranking.results[battle_member.member_id] = points_in_battle(battle_id, battle_member.member_id)
    end
    ranking
  end

  private

  def points(user_id)
    challenge_members = ChallengeMember.where(member_id: user_id)
    challenge_members.inject(0) do |sum, challenge_member|
        sum += challenge_member.challenge.points
    end
  end

  def points_in_battle(battle_id, member_id)
    challenge_members = ChallengeMember.where(challenge_id: Battle.find(battle_id).challenges.pluck(:id))
    challenge_members.where(member_id: member_id).inject(0) do |challenge_member|
        sum += challenge_member.challenge.points
    end
  end
end