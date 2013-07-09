

module TimeTag
  module Parser
    
    @@pattern_classes = []
    
    class << self
      
      def to_tag string
      end
      
      def matches string
        merge_matches(string.to_enum :scan, pattern).map(&:compact).select do |m|
          throw ArgumentError if m.size > 2
          m.size == 2
        end
      end
      
      def merge_matches matches_array
        vars.zip *matches_array
      end
      
      def vars
        @@vars ||= patterns.inject [] do |acc, pattern|
          acc | pattern.vars.map { |v| [pattern.class.to_s, v] }
        end
      end
      
      def pattern
        @@pattern ||= /(?:#{ patterns.map {|p| p.body.to_s}.join('|') })+/
      end
      
      def patterns
        @@patterns ||= @@pattern_classes.map { |p| p.new }
      end

      def register p
        @@pattern_classes << p
      end

    end
    
  end
end
