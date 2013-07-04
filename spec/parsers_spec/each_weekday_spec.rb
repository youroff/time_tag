require 'spec_helper'

module SmartTime
  module Parsers
    describe Base do
      before :each do
        processor = Processor.new
        @parser = EachWeekday.new processor
      end
  
      describe "pattern matches" do
        it "matches all variants" do
          ["Каждый понедельник", "Каждую  СУББОТУ", "Каждый понедельник"].each do |string|
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