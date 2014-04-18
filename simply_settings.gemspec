$:.push File.expand_path("../lib", __FILE__)

require "simply_settings/version"

Gem::Specification.new do |s|
  s.name        = "simply_settings"
  s.version     = SimplySettings::VERSION
  s.authors     = ["Pete Broderick"]
  s.email       = ["pete@simplybinary.com"]
  s.homepage    = "http://github.com/simplyb/simply_settings"
  s.summary     = "Database backed, cached, dynamic application settings."
  s.description = "Database backed, cached, dynamic application settings."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.4"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "debugger"
end
