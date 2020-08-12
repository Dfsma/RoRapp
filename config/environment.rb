# Load the Rails application.
require_relative 'application'
# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    domain: 'https://murmuring-hamlet-87639.herokuapp.com/',
    address:        "smtp.sendgrid.net",
    port:            587,
    authentication: :plain,
    user_name:      'apikey',
    password:       ENV['SENDMAIL_PASSWORD']
}