# MTG Fetch


This application has been launched as of October 9th 2016! To view my app just go to https://calm-atoll-54619.herokuapp.com/login and use the email admin@admin.com with the password 'password'.

/* NEWS
November 6th 2016

-Intergrating and Testing angular
-Moving delete button besides card name in index page
-Renaming collections page
*/


MTG Fetch is a Ruby on Rails 4 application that I made during my time at the Actualize 
programming bootcamp. The back end of this application was written in ruby and the front end was written in html, css and javascript. Postgresql was used as the relational database to store card and pricing data.

MTG Fetch automates the process of investing with three features.

-Collection manager
-Price histories
-SMS notifications

The collection manager allows the user to see their entire Magic the Gathering card portfolio. They can see the current market price of their cards and how many of the cards they own. They can click on 'read more' for more information.

Once a user adds a card to their collection, MTG Fetch will show the price history of that card, if that card does not exist in the app's database, it will be created and begin to collect current price information on that card and save it every day.

A user can set a desired buy or desired sell price and when the market price of that card reaches that price, MTG fetch will notify the user of the new price change.