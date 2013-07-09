require 'yaml'
require_relative '../parser'

module TimeTag
  module Patterns
    class Base
      
      P = {
        time: /\d{1,2}(?::\d{,2})?/
      }
      
      def initialize
        @dict       = YAML::load_file File.join(File.expand_path('../../../dicts', __dir__), 'dict.yml')
      end
      
      def vars
        raise NotImplementedError
      end
      
      def process attributes, data
        raise NotImplementedError
      end
      
      def dict
        @dict
      end
      alias :d :dict
      
      def weekdays
        d['weekdays'].map { |k,v| v }.join '|'
      end
    
      def self.register
        Parser.register self
      end
            
    end
  end
end