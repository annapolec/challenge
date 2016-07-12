password = "password"

20.times do |i|
  User.create(email: Faker::Internet.email, password: '123456')
  Group.create(name: Faker::Team.creature)
  Battle.create(name: Faker::Team.sport, owner_id: Faker::Number.between(1, User.count), mode: 'for_users')
  Battle.create(name: Faker::Team.sport, owner_id: Faker::Number.between(1, User.count), mode: 'for_groups')
end

Group.all.each do |group|
  3.times do |i|
    GroupUser.create(group_id: group.id, user_id: Faker::Number.between(1, User.count))
  end
end

counter = 1
Battle.all.each do |battle|
  5.times do |i|
    if battle.mode == 'for_users'
      BattleMember.create(battle_id: battle.id, member_id: Faker::Number.between(1, User.count), member_type: 'User')
      Challenge.create(battle_id: battle.id, name: "Challenge \##{counter + i}", desc: Faker::Lorem.sentence, points: Faker::Number.between(1, 100))
      counter =+ 1
    else  
      BattleMember.create(battle_id: battle.id, member_id: Faker::Number.between(1, Group.count), member_type: 'Group')
      Challenge.create(battle_id: battle.id, name: "Challenge \##{counter + i}", desc: Faker::Lorem.sentence, points: Faker::Number.between(1, 100))
      counter =+ 1
    end
  end
end

Challenge.all.each do |challenge|
  3.times do |i|
    if challenge.battle.mode == "for_users"
      ChallengeMember.create(challenge_id: challenge.id, member_type: "User", member_id: challenge.battle.battle_members.shuffle.first.member_id)
    else
      ChallengeMember.create(challenge_id: challenge.id, member_type: "Group", member_id: challenge.battle.battle_members.shuffle.first.member_id)
    end 
  end
end