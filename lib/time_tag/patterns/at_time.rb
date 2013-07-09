module TimeTag
  module Patterns
    class AtTime < Base
      
      register
      
      def body
        /#{d['directives']['at']} \s+ (#{P[:time]}) (?:\s+(?:#{d['units']['hour']}))?/xi
      end
      
      def vars
        [:time]
      end
    end
  end
end