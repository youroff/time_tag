module TimeTag
  module Parser
    class TimeInterval < Base
      
      attr_reader :result
      
      def pattern
        /#{d['directives']['from']} \s+ (#{P[:time]}) \s+ #{d['directives']['to']} \s+ (#{P[:time]}) (?:\s+(?:#{d['units']['hour']}))?/xi
      end
      
      def vars
        [:start, :end]
      end


    end
  end
end