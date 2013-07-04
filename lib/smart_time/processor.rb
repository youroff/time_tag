require 'smart_time/parsers/base'
require 'smart_time/parsers/each_weekday'
require 'smart_time/parsers/time_interval'

module SmartTime
  class Processor
    
    def initialize
      #  string
      # @time = string
    end
    
    def self.parse string
      processor = new
      processor.parse string
    end
    
    def parsers
      @parsers ||= parsers_classes.map { |parser_class| parser_class.new self }
    end
    
  private
    def parsers_classes
      [EachWeekday, TimeInterval]
    end
         
  end
end