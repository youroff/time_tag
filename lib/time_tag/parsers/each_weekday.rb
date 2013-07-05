module TimeTag
  module Parser
    class EachWeekday < Base
      
      def pattern
        /(?:#{d['directives']['each']}) \s+ (#{weekdays})/xi
      end
      
      def vars
        [:weekday]
      end

    end
  end
end