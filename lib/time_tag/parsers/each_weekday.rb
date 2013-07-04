module TimeTag
  module Parsers
    class EachWeekday < Base
      
      def pattern
        /(?:#{d['directives']['each']})\s+(#{weekdays_mask})/i
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