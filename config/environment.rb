# Load the rails application
require File.expand_path('../application', __FILE__)

heroku_config = File.join(RAILS_ROOT, 'config', 'heroku.yml')
if !Rails.env.production? && File.exists?(heroku_config)
  config_env = YAML.load_file(heroku_config)
  config_env['local'].each { |k, v| ENV[k.upcase] = v }
end

# Initialize the rails application
Photocollider::Application.initialize!
