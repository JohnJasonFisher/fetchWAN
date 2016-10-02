every 1.day, :at => '8:00 pm' do
  runner "Card.record_market_prices", environment: "development"
end
