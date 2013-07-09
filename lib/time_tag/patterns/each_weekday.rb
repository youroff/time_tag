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

    end
  end
end