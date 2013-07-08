module TimeTag
  module Parser
    class AtTime < Base
      
      register self
      
      def pattern
        /#{d['directives']['at']} \s+ (#{P[:time]}) (?:\s+(?:#{d['units']['hour']}))?/xi
      end
      
      def vars
        [:time]
      end
    end
  end
end