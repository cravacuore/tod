require 'rest-client'

class TodMailer
  include Singleton
  attr_accessor :key, :sender, :on_before_send

  def self.config_mailgun(key, sender)
    TodMailer.instance.key    = key
    TodMailer.instance.sender = sender
  end

  def self.before_send(&block)
    TodMailer.instance.on_before_send = block
  end

  def self.send_mail(target, subject, text, from = 'Tod Administrator')
    mailer = TodMailer.instance
    mailer.on_before_send.call if mailer.on_before_send
    if mailer.key && mailer.sender
      RestClient::Request.execute(
        :url => "https://api:#{mailer.key}@api.mailgun.net/v3/#{mailer.sender}.mailgun.org/messages",
        :method => :post,
        :payload => {
          :from =>  "#{from} <postmaster@#{mailer.sender}.mailgun.org>",
          :sender => 'Mailgun Sandbox <postmaster@sandbox30000.mailgun.org>',
          :to => target,
          :subject => subject,
          :text => text,
          :multipart => true
        },
        :headers => {
          :'h:X-My-Header' => 'www/mailgun-email-send'
        },
        :verify_ssl => false
      )
    end
  end
end