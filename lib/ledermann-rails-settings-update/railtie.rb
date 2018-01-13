require 'rails/railtie'

module LedermannRailsSettingsUpdate
    class Railtie < Rails::Railtie

        initializer 'ledermann-rails-settings-update.action_controller' do
            ActiveSupport.on_load :action_controller do
                include LedermannRailsSettingsUpdate
            end
        end

    end
end
