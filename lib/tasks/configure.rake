namespace :configure do
  desc "configure heroku"
  task :heroku do
    values = YAML.load_file("config/heroku.yml")
    values['heroku'].each do |k,v|
      puts "heroku config:add #{k.upcase}=\"#{v} --app=#{values['app']}\""
      `heroku config:add #{k.upcase}="#{v} --app=#{values['app']}"`
    end
  end

  desc "configure local development"
  task :local do
    values = YAML.load_file("config/heroku.yml")
    values['local'].each do |k,v|
      puts "export #{k.upcase}=\"#{v}\""
      `export #{k.upcase}="#{v}"`
    end
  end
end
