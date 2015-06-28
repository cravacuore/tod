case Padrino.env
  when :development then begin
    TodMailer.config_mailgun(
        key = 'key-8d24af78cd198587a39e7e1c0cee25b5',
        sender = 'sandboxefb52827f90c4a2c88ad6776b1f97c2f'
    )
  end
  when :production  then begin
    TodMailer.config_mailgun(
      key    = ENV['MAILGUN_KEY'],
      sender = ENV['MAILGUN_SENDER']
    )
  end
  else
    # nothing
end
