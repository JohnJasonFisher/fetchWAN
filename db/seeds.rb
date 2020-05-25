Card.create!([
  {name: "Arid Mesa", image_url: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=177584&type=card", multiverse_id: 177584, set_name: "Zendikar", current_price: "9.93", set: "ZEN"},
  {name: "Thoughtseize", image_url: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=373632&type=card", multiverse_id: 373632, set_name: "Theros", current_price: "3.82", set: "THS"},
  {name: "Path to Exile", image_url: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=370408&type=card", multiverse_id: 370408, set_name: "Modern Masters", current_price: "2.75", set: "MMA"},
  {name: "Bitterblossom", image_url: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=397701&type=card", multiverse_id: 397701, set_name: "Modern Masters 2015 Edition", current_price: "8.58", set: "MM2"}
])
CardUser.create!([
  {user_id: 1, card_id: 1, desired_sell_price: "10.0", desired_buy_price: "1.0", quantity: 1, multiverse_id: 397701},
  {user_id: 1, card_id: 3, desired_sell_price: "10.0", desired_buy_price: "4.0", quantity: 1, multiverse_id: 373632},
  {user_id: 1, card_id: 4, desired_sell_price: "8.0", desired_buy_price: "2.0", quantity: 4, multiverse_id: 370408},
  {user_id: 1, card_id: 2, desired_sell_price: "11.0", desired_buy_price: "2.0", quantity: 1, multiverse_id: 177584}
])
Price.create!([
  {card_id: 3, price: "3.82"},
  {card_id: 2, price: "9.93"},
  {card_id: 1, price: "8.58"},
  {card_id: 4, price: "2.75"}
])
User.create!([
  {email: "user@email.com", password_digest: "$2a$10$kaxeECC.wYBrvZPqV24Mnu4rQd8OayyuNwrL5kwbDPYaC3ky6RnTC", name: "user", phone_number: nil}
])
