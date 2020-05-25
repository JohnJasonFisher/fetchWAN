#legacy-mtg-app

- clone the rails project locally
- run `bundle instal`
- run `bundle exec rake db:create`
- run `bundle exec rake db:migrate` (this will fail)
- create table called 'alerts' with a column named 'user_id'
- run `bundle exec rake db:migrate` (this will pass)
- run `bundle exec rake db:seed`
- run `rails s`