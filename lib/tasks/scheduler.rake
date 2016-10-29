desc "This task is called by the Heroku scheduler add-on"

task :record_market_prices => :environment do
  puts "Fetching market prices..."
  Card.record_market_prices
  puts "done."
end
