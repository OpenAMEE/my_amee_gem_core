Gem::Specification.new do |s|
  s.name = "my_amee_core"
  s.version = "1.1.0"
  s.date = "2011-01-01"
  s.summary = "Rails plugin for core my.amee.com services"
  s.email = "james@amee.com"
  s.homepage = "https://my.amee.com"
  s.has_rdoc = true
  s.authors = ["James Smith"]
  s.files = ["README", "COPYING"] 
  s.files += ['lib/my_amee.rb', 'lib/my_amee/config.rb']
  s.files += ['init.rb', 'rails/init.rb', 'my_amee.example.yml']
end
