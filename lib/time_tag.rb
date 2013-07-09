require 'active_support/time'
require 'time_tag/tag'
require 'time_tag/parser'
require 'time_tag/suggest'

require 'time_tag/patterns/base'

Dir[File.join(File.dirname(__FILE__), 'time_tag/patterns', "*.rb")].each do |file|
   require File.join('time_tag/patterns', File.basename(file))
end