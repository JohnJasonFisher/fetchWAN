# every 1.minute do
#   runner "Card.record_retail_price", environment: "development"
# end

every 1.day, :at => '7:00 pm' do
  runner "Card.record_market_price", environment: "development"
end

every 1.day, :at => '7:00 am' do
  runner "Card.record_market_price", environment: "development"
end