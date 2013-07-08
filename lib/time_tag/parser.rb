

module TimeTag
  module Parser
    
    @@parser_classes = []
    
    class << self
      
      def to_tag string
      end
      
      def matches string
        merge_matches(string.to_enum :scan, pattern).map(&:compact).select do |m|
          throw ArgumentError if m.size > 2
          m.size == 2
        end
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
        @@parsers ||= @@parser_classes.map { |p| p.new }
      end

      def register p
        @@parser_classes << p
      end

    end
  end
end
