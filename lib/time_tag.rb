require 'active_support/time'
require 'time_tag/tag'
require 'time_tag/parser'
require 'time_tag/suggest'

require 'time_tag/parsers/base'

Dir[File.join(File.dirname(__FILE__), 'time_tag/parsers', "*.rb")].each do |file|
   require File.join('time_tag/parsers', File.basename(file))
end