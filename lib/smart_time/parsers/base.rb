require 'yaml'

module SmartTime
  module Parsers
    class Base
      
      P = {
        time: /\d{1,2}(?::\d{,2})?/
      }
      
      def initialize processor
        @processor  = processor
        @dict       = YAML::load_file File.join(File.expand_path('../../../dicts', __dir__), 'dict.yml')
      end
      
      def dict
        @dict
      end
      alias :d :dict
      
    end
  end
end