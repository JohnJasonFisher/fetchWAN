User.destroy_all
Card.destroy_all
CardUser.destroy_all


power9 = ["Black Lotus", "Time Walk", "Ancestral Recall", "Mox Sapphire", "Mox Jet", "Mox Ruby", "Mox Pearl", "Mox Emerald", "Timetwister"]

power9.each do |power|
  card = Card.create(
    name: power,
    price: 1,
    ref_time: 23.years.ago
  )
end

names = ["peter", "josh", "jay", "mike", "diana"]

names.each do |name|
  user = User.create(
    name: name,
    email: "#{name}@#{name}.com",
    password: "password"
  )
  user.save
end

cards = Card.all
User.all.each do |user|
  card_user = CardUser.create(
    user_id: user.id,
    card_id: cards.sample.id,
    quantity: rand(10) + 1
  )
end

user = User.all
alert = Alert.create(
  user_id: user.sample.id,
  title: "title",
  text: "stuff n junk",
  )

puts "It's working!"