require 'spec_helper'

module TimeTag
  module Patterns
    describe Base do
      before :each do
        @pattern = Base.new
      end
  
      describe "dictionary access" do
        it "is equipped with dictionary" do
            @pattern.dict.should be_a Hash
        end
        
        it "is gives back proper values" do
            @pattern.d['weekdays'][0].should match /воскресенье/
        end
      end

    end
  end
end