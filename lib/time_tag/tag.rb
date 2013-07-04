module TimeTag
  class Tag
    
    attr_reader :time
    attr_reader :duration
    
    def initialize time = Time.now
      @time = time
    end
    
    def next
    end
         
  end
end