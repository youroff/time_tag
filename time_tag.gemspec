Gem::Specification.new do |s|
  s.name        = 'time_tag'
  s.version     = '0.0.0'
  s.date        = '2013-07-04'
  s.summary     = "TimeTag - cyclic time and intervals parsed from a string"
  s.description = ""
  s.authors     = ["Ivan Youroff"]
  s.email       = 'ivan.youroff@gmail.com'
  s.files       = ["{lib}/**/*.rb", "{dicts}/*.yml", "*.md"]
  # s.homepage    =
  #   'http://rubygems.org/gems/hola'
  s.add_dependency "active_support"
  
  s.add_development_dependency "rspec"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "growl"
  s.add_development_dependency "guard-bundler"
  s.add_development_dependency "rb-fsevent"
end