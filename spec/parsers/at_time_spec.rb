require 'spec_helper'

module TimeTag
  module Parser
    describe AtTime do
      before :each do
        @parser = AtTime.new
      end
  
      describe "pattern matches" do
        it "matches all variants" do
          ["В 12:30", "в 4 часа"].each do |string|
            @parser.pattern.should match string
          end
        end
        
        it "binds variable in proper order" do
          matches = @parser.pattern.match "в 15:54"
          $1.should == '15:54'
        end
        
        it "has the same number of variables in `vars` and pattern" do
          matches = @parser.pattern.match "в 15:54"
          matches.captures.size.should == @parser.vars.size
        end
      end
        

    end
  end
end