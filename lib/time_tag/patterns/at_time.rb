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
      
      def process attributes, data
        time = data[:time].split ':'
        attributes.update({
          point: {
            hours: time.first.to_i,
            minutes: time.size == 2 ? time.last.to_i : 0
          }
        })
      end
    end
  end
end