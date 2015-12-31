$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "loco/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "loco"
  s.version     = Loco::VERSION
  s.authors     = ["himn1"]
  s.email       = ["zbigniew.humeniuk@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Loco."
  s.description = "Description of Loco."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 4.2'
  s.add_dependency 'coffee-rails', '~> 4.1'

  s.add_development_dependency 'minitest-reporters', '~> 1.1'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'bcrypt', '~> 3.1'
  s.add_development_dependency 'hirb', '~> 0.7'
  s.add_development_dependency 'sass-rails', '~> 5.0'
  s.add_development_dependency 'capybara', '~> 2.5.0'
  s.add_development_dependency 'launchy', '~> 2.4.3'
end
