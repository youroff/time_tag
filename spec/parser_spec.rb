require 'spec_helper'

module TimeTag
  describe Parser do
    # before :each do
    #   @parser = Parser.new
    # end
    
    describe "parser's config" do
      it "has parsers instances" do
        Parser.parsers.each {|p| p.should be_a_kind_of TimeTag::Parser::Base }
      end
      
      it "concatenates patterns to on giant mega pattern" do
        Parser.pattern.should be_an_instance_of Regexp
      end
    end
    
    # describe "#new" do
    #   it "combines pattern out of Parser's classes" do
    #       @parser.pattern.should be_an_instance_of Regexp
    #   end
    # end
  end
end