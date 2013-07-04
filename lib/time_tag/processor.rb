require 'time_tag/parsers/base'
require 'time_tag/parsers/each_weekday'
require 'time_tag/parsers/time_interval'

module TimeTag
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