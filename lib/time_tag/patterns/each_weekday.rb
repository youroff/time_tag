module TimeTag
  module Patterns
    class EachWeekday < Base
      
      register
      
      def body
        /(?:#{d['directives']['each']}) \s+ (#{weekdays})/xi
      end
      
      def vars
        [:weekday]
      end

      def process attributes, data
        attributes
      end
      
    end
  end
end