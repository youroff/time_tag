require 'spec_helper'

module SmartTime
  module Parsers
    describe Base do
      before :each do
        processor = Processor.new
        @parser = Base.new processor
      end
  
      describe "dictionary access" do
        it "is equipped with dictionary" do
            @parser.dict.should be_a Hash
        end
        
        it "is gives back proper values" do
            @parser.d['weekdays'][0].should match /воскресенье/
        end
      end

    end
  end
end