require_relative 'boot'

require 'rails/all'
<<<<<<< HEAD
require 'sprocket/railtie'
=======
# require 'sprocket/railtie'
>>>>>>> f93278b41b26feb015d61208fa443d658037fe50
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Inclub
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
