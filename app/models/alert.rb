class Alert < ActiveRecord::Base
  belongs_to :user

  def alert_seller
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

    @message = @client.messages.create(
      to: user.phone_number,
      # to: "+18152050931",
      from: "+18152050931",
      body: "Hello, you are recieving this text because you have a card that is worth your sell price."
    )
  end

  def user
    User.find_by(id: user_id)
  end
end
