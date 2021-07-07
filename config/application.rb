require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "view_component/engine"
require "view_component/storybook/engine"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.require "view_component/engine"

Bundler.require(*Rails.groups)

module QwizardReactive
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.autoload_paths << Rails.root.join("app", "frontend", "components")
    config.view_component.preview_paths << Rails.root.join("app", "frontend", "components")

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Enable ViewComponents previews
    config.view_component.show_previews = true
    config.view_component_storybook.stories_path = Rails.root.join("spec/components/stories")
  end
end
