require 'spec_helper'

module TimeTag
  module Patterns
    describe EachWeekday do
      before :each do
        @pattern = EachWeekday.new
      end
  
      describe "pattern matches" do
        it "matches all variants" do
          ["Каждый понедельник", "Каждую  СУББОТУ", "Каждое воскресенье"].each do |string|
            @pattern.body.should match string
          end
        end
        
        it "binds variable in proper order" do
          matches = @pattern.body.match "Каждый понедельник"
          $1.should match /понедельник/i
        end
        
        it "has the same number of variables in `vars` and pattern" do
          matches = @pattern.body.match "Каждый понедельник"
          matches.captures.size.should == @pattern.vars.size
        end
      end
        

    end
  end
end