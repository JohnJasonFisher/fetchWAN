User.destroy_all
Card.destroy_all
CardUser.destroy_all

names = ["test", "peter", "josh", "jay", "mike", "diana"]

names.each do |name|
  user = User.create(
    name: name,
    email: "#{name}@#{name}.com",
    password: "password"
  )
  user.save
end

User.all.each do |user|
  random_num = rand(999) + 1
  user_cards = CardUser.new(
    user_id: user.id,
    multiverse_id: random_num,
    quantity: random_num,
    desired_sell_price: random_num,
    desired_buy_price: random_num
  )
end