every 1.day, :at => '7:35 pm' do
  runner "Card.record_market_price", environment: "development"
end

every 1.day, :at => '7:35 am' do
  runner "Card.record_market_price", environment: "development"
end
