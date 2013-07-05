require 'time_tag/parsers/base'
require 'time_tag/parsers/each_weekday'
require 'time_tag/parsers/time_interval'
require 'time_tag/parsers/at_time'

module TimeTag
  module Parser
    
    PARSERS = [EachWeekday, TimeInterval, AtTime]
    
    class << self
      
      def to_tag string
      end
      
      def matches string
        merge_matches(string.to_enum :scan, pattern)
      end
      
      def merge_matches(matches_array)
        vars.zip *matches_array
      end
      
      def vars
        @@vars ||= parsers.inject [] do |acc, parser|
          acc | parser.vars.map { |v| [parser.class.to_s, v] }
        end
      end
      
      def pattern
        @@pattern ||= /(?:#{ parsers.map {|p| p.pattern.to_s}.join('|') })+/
      end
      
      def parsers
        @@parsers ||= PARSERS.map { |p| p.new }
      end
    end
    

    
  #   def parse string
  #     parser = new
  #     parser.parse string
  #   end
  #   
  #   def parsers
  #     @parsers ||= parsers_classes.map { |parser_class| parser_class.new }
  #   end
  #   
  #   def pattern
  #     parsers.inject('') { |acc, parser| acc + parser.pattern }
  #   end
  #   
  # private
  #   def parsers_classes
  #     [EachWeekday, TimeInterval, AtTime]
  #   end
         
  end
end