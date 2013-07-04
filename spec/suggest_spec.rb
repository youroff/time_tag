require 'spec_helper'

module TimeTag
  describe Suggest do
    before :each do
      @suggest = Suggest.new
    end
  
    describe "data source" do
      it "is an array" do
        @suggest.options.should be_an Array
      end
      
      it "is sorted" do
        @suggest.options.should == @suggest.options.sort
      end
      
      it "is distinct" do
        @suggest.options.should == @suggest.options.uniq
      end
    end

    describe "search" do
      it "outputs all options on empty query" do
        Suggest.by('').should == @suggest.options
      end
      
      it "outputs appropriate items" do
        Suggest.by('вос').each { |res| res.should match /^вос/ }
      end
      
      it "outputs empty array if no matches" do
        Suggest.by('dfkgjdlkgjfdkg').should be_empty
      end
    end
    
    
  end
end