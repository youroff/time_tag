# This module provides interface to the parser.

module TimeTag
  module Parser
    
    @@pattern_classes = []
    
    class << self
      
      # Parse string to TimeTag
      def to_tag string
        Tag.new to_attributes(string)
      end
      
      # Convert String to Attributes
      #
      def to_attributes string
        matches = normalize(matches string)
        patterns.inject Attributes.new do |acc, pattern|
          key = pattern.class.to_s
          matches.include?(key) ? pattern.process(acc, matches[pattern.class.to_s]) : acc
        end
      end   
      
      # Match string against Giant pattern
      # Outputs:
      #
      #   Array of [[PatternClass, :var_symbol], found_value]
      #
      # Raises an error in case of ambiguity: i.e. one pattern met more than once
      #
      def matches string
        merge_matches(string.to_enum :scan, pattern).map(&:compact).select do |m|
          raise ArgumentError if m.size > 2
          m.size == 2
        end
      end
      
      # Vars array
      # Projection of each Pattern's vars to Giant pattern ones:
      #
      #   Array of [PatternClass, :var_symbol]
      #
      def vars
        @@vars ||= patterns.inject [] do |acc, pattern|
          acc | pattern.vars.map { |v| [pattern.class.to_s, v] }
        end
      end
      
      # Giant pattern
      # Calculated as a disjunction of all registered Patterns
      #
      def pattern
        @@pattern ||= /(?:#{ patterns.map {|p| p.body.to_s}.join('|') })+/
      end
      
      # Instatiate Patterns and return an array.
      #
      def patterns
        @@patterns ||= @@pattern_classes.map { |p| p.new }
      end

      # Register pattern
      #
      def register p
        @@pattern_classes << p
      end
      
    private
      
      # Merge results of matching with vars array
      # 
      def merge_matches raw_matches
        vars.zip *raw_matches
      end
      
      # Normalize matches array
      # Collects vars of the same Pattern and builds a hash
      #
      #   {"ParserClass" => {:var => value, :var2 => value2}}
      #
      def normalize matches_array
        matches_array.inject({}) do |acc, (key, value)|
          acc[key.first] = {} unless acc[key.first]
          acc[key.first][key.last] = value
          acc
        end
      end

    end
    
  end
end
