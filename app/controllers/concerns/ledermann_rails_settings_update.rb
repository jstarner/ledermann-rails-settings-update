module LedermannRailsSettingsUpdate

    extend ActiveSupport::Concern

    private

    def update_settings instance
        settings = settings_params[:settings]
        settings.each do |key, value|
            value.each do |k, v|
                if v == 'true' || v == '1'
                    settings[key][k] = true
                elsif v == 'false' || v == '0'
                    settings[key][k] = false
                end
            end
            instance.settings(key.to_sym).update_attributes value
        end
    end

end
