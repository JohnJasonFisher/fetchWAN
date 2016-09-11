json.array! @usercards.each do |usercard|
  json.name usercard.card.name
  json.imageUrl usercard.card.image_url
  json.currentPrice usercard.card.current_price
  json.quantity usercard.quantity
end