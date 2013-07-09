require 'spec_helper'

module TimeTag
  describe Parser do
    
    describe "parser's config" do
      it "has parsers instances" do
        Parser.patterns.each { |p| p.should be_a_kind_of TimeTag::Patterns::Base }
      end
      
      it "concatenates patterns to one giant mega pattern" do
        Parser.pattern.should be_an_instance_of Regexp
      end
    end
    
    describe "parsing" do
      it "founds matches" do
        matches = Parser.matches 'каждую пятницу'
        matches.size.should be 1
        matches.first.last.should =~ /пятницу/
        matches.first.first.should eq ["TimeTag::Patterns::EachWeekday", :weekday]
      end

    end
    
    describe "to_attributes" do
      it "generates Attributes object" do
        Parser.to_attributes('каждую пятницу').should be_instance_of Attributes 
      end
    end
    
    
    
  end
end