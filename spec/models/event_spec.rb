require 'spec_helper'

describe Event do
  context "Required fields" do
    it "should require name" do
      FactoryGirl.build(:event, name: nil).should_not be_valid
    end
    it "should require destination" do
      FactoryGirl.build(:event, destination: nil).should_not be_valid
    end
    it "should require arrival time" do
      FactoryGirl.build(:event, arrival_time: nil).should_not be_valid
    end
  end
end
