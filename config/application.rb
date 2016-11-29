require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    config.time_zone = 'Eastern Time (US & Canada)'
    Dotenv::Railtie.load # was missing this line and it was causing a TypeError (no implicit conversion of nil into String) because ENV['JWT_SECRET'] was nil in users_contrroller.rb token method.
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
