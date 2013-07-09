require 'spec_helper'

module TimeTag
  module Patterns
    describe TimeInterval do
      before :each do
        @pattern = TimeInterval.new
      end
  
      describe "pattern matches" do
        it "matches all variants" do
          ["С 12 до 22 часов", "с 15:54 до 16:56"].each do |string|
            @pattern.body.should match string
          end
        end
        
        it "binds variable in proper order" do
          matches = @pattern.body.match "с 15:54 до 16:56"
          $1.should == '15:54'
          $2.should == '16:56'
        end
        
        it "has the same number of variables in `vars` and pattern" do
          matches = @pattern.body.match "с 15:54 до 16:56"
          matches.captures.size.should == @pattern.vars.size
        end
      end
        

    end
  end
end