every 1.day, :at => '8:00 am' do
  runner "Card.record_market_prices", environment: "development"
end

every 1.day, :at => '11:00 pm' do
  runner "Card.record_market_prices", environment: "development"
end

every 1.day, :at => '7:00 pm' do
  runner "Card.record_market_prices", environment: "development"
end
