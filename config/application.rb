require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Travely
  class Application < Rails::Application
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.generators do |generate|
          generate.assets false
          generate.helper false
          generate.test_framework  :test_unit, fixture: false
        end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Unsplash.configure do |config|
    #   config.application_access_key = ENV["UNSPLASH_ACCESS_KEY"]
    #   config.application_secret = ENV["UNSPLASH_SECRET_KEY"]
    #   config.application_redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
    #   config.utm_source = "travely"
    # end
  end


end
