module SmartTime
  module Parsers
    class EachWeekday < Base
      
      def pattern
        /кажд(?:ый|ую|ое)\s+(#{weekdays_mask})/i
      end
      
      def weekdays
        d['weekdays']
      end
      
      def weekdays_mask
        weekdays.map { |k,v| v }.join '|'
      end
    end
  end
end