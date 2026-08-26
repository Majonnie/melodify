require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Melodify
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.autoload_paths << Rails.root.join("app/form_builders")

    # Use Slim for all generators
    config.generators do |g|
      g.template_engine :slim
    end

    # Somehow helps Tailwind to wake up
    config.assets.debug = true

    # Use custom TailwindFormBuilder globally
    config.action_view.default_form_builder = "TailwindFormBuilder"
  end
end
