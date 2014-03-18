if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV['app22666725@heroku.com'],
    :password       => ENV['qpsvvuhu'],
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
  }
end