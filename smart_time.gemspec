Gem::Specification.new do |s|
  s.name        = 'smart_time'
  s.version     = '0.0.0'
  s.date        = '2013-07-04'
  s.summary     = "SmartTime - cyclic time and intervals parsed from a string"
  s.description = ""
  s.authors     = ["Ivan Youroff"]
  s.email       = 'ivan.youroff@gmail.com'
  s.files       = ["lib/smart_time.rb"]
  # s.homepage    =
  #   'http://rubygems.org/gems/hola'
  s.add_dependency "active_support"
  s.add_development_dependency "rspec"
end