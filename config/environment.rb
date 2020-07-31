# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey',
    :password => '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',
    :domain => 'yourdomain.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }