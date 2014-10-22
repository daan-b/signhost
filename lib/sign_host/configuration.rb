module SignHost
  class Configuration
    ATTRIBUTES = %i(app_name api_key app_key shared_secret)
    attr_reader *ATTRIBUTES

    def initialize(arguments)
      arguments.assert_valid_keys(ATTRIBUTES)
      arguments.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def application_key
      "#{app_name} #{app_key}"
    end

  end
end
