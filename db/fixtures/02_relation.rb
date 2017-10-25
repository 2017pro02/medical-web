(1..5).each do |i|
  Relation.seed do |r|
    r.id = i
    r.follower_id = i
    r.followed_id = i + 5
  end
end
