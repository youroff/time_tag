name = 'time_tag'

notification :growl

guard 'bundler' do
  watch('Gemfile')
  watch(%r{^(.+)\.gemspec$})

end



guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/#{name}/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/#{name}/(.+)/(.+)\.rb$})     { |m| "spec/#{m[1]}/#{m[2]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch(%r{^lib/#{name}\.rb$})  { "spec" }
  watch(%r{^dicts/.+\.yml$})  { "spec" }
end

