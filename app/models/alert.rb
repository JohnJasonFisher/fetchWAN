class Alert < ActiveRecord::Base
  belongs_to :user

  def self.alert_admin
    @twilio_number = ENV['TWILIO_NUMBER_PHONE_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => ENV['MY_PHONE_NUMBER'],
      :body => 'Price has changed!'
    )
  end

  def self.alert_seller(user_id, user_phone_number, card_name)
    @twilio_number = ENV['TWILIO_NUMBER_PHONE_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    title = "#{card_name} is over your sell price"
    text = "Hello,your card's price has meet or exceded your desired sell price."

    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => user_phone_number,
      :body => text
    )
    Alert.create(
      user_id: user_id,
      title: title,
      text: text
    )
  end
end
