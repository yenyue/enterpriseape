ActionMailer::Base.smtp_settings = {
#  :address        => 'smtp.sendgrid.net',
  :address        => 'smtp.gmail.com',
  :port           => '587',
  :authentication => :plain,
#  :user_name      => ENV['SENDGRID_USERNAME'],
#  :password       => ENV['SENDGRID_PASSWORD'],
#  :user_name            => 'Aapp34639861@heroku.com',
#  :password             => 'qop3kdm4',
#  :user_name            => 'yenyue_07876@yahoo.com',
#  :password             => 'par5ley',

  :user_name            => 'yenyuepai@gmail.com',
  :password             => 'par5ley',

  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}