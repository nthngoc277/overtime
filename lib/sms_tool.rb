module SmsTool
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']

  @client = Twilio::REST::Client.new(account_sid, auth_token)

  # test phone_number for both from and to: +15005550006
  def self.send_sms(number:, message:)
    @client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: "#{number}",
      body: message
    )
  end
end
