require 'spec_helper'

module TimeTag
  describe Tag do
    before :each do
      @tag = Tag.new Attributes.new
    end
  
    describe "#new" do
      it "is a Tag object" do
          @tag.should be_an_instance_of Tag
      end
    end
  end
end