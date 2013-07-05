require 'spec_helper'

module TimeTag
  module Parser
    describe EachWeekday do
      before :each do
        @parser = EachWeekday.new
      end
  
      describe "pattern matches" do
        it "matches all variants" do
          ["Каждый понедельник", "Каждую  СУББОТУ", "Каждое воскресенье"].each do |string|
            @parser.pattern.should match string
          end
        end
        
        it "binds variable in proper order" do
          matches = @parser.pattern.match "Каждый понедельник"
          $1.should match /понедельник/i
        end
      end
        

    end
  end
end