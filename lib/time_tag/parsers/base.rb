require 'yaml'
require_relative '../parser'

module TimeTag
  module Parser
    class Base
      
      P = {
        time: /\d{1,2}(?::\d{,2})?/
      }
      
      def initialize
        @dict       = YAML::load_file File.join(File.expand_path('../../../dicts', __dir__), 'dict.yml')
      end
      
      def vars
        throw NotImplementedError
      end
      
      def dict
        @dict
      end
      alias :d :dict
      
      def weekdays
        d['weekdays'].map { |k,v| v }.join '|'
      end
    
      def self.register klass
        Parser.register klass
      end
    end
  end
end