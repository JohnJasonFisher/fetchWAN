class Alert < ActiveRecord::Base
  belongs_to :user

  def self.send_message
    @twilio_number = ENV['TWILIO_NUMBER_PHONE_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => ENV['MY_PHONE_NUMBER'],
      :body => 'TESTING 1,2,3'
    )
  end
end
