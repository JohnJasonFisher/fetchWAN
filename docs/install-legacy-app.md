# legacy-mtg-app

## Run before update
- clone the rails project locally
- run `bundle instal`
- run `bundle exec rake db:create`
- run `bundle exec rake db:migrate` (this will fail)
- create table called 'alerts' with a column named 'user_id'
- run `bundle exec rake db:migrate` (this will pass)
- run `bundle exec rake db:seed`
- run `rails s`

## Run after update (migrations where deleted) https://stackoverflow.com/a/36116829
- clone the rails project locally
- run `bundle instal`
- run `bundle exec rake db:create`
- run `bundle exec rake db:schema:load
- run `bundle exec rake db:seed`
- run `rails s`