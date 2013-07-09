module TimeTag
  module Patterns
    class TimeInterval < Base
      
      register
      
      def body
        /#{d['directives']['from']} \s+ (#{P[:time]}) \s+ #{d['directives']['to']} \s+ (#{P[:time]}) (?:\s+(?:#{d['units']['hour']}))?/xi
      end
      
      def vars
        [:start, :end]
      end

    end
  end
end