require 'yaml'
require 'json'

module MyAmee
  class Config

    def self.get
      # Load appstore config from YAML
      my_amee_config = "#{::Rails.root}/config/my_amee.yml"
      if File.exist?(my_amee_config)
        # Load config
        return YAML.load_file(my_amee_config)[::Rails.env]
      else
        Rails.logger.info "WARNING: My AMEE configuration file not found. Copy my_amee.example.yml to config/my_amee.yml and edit."
        return nil
      end
    end

  end
end
