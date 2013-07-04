module SmartTime
  module Parsers
    class TimeInterval < Base
      
      attr_reader :result
      
      def pattern
        /с\s+(#{P[:time]})\s+до\s+(#{P[:time]})(?:\s+(?:#{d['units']['hour']}))?/i
      end
      
      def vars
        [:interval_start, :interval_end]
      end
      
      def find
        @result = {}
        results = pattern.match @string
        vars.each_with_index do |v, i|
          @result[v] = results[i + 1]
        end
      end
    end
  end
end