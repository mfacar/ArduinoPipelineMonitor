require 'spec_helper'

describe BuildPassedCommand do
  describe "#execute" do
    it "should return success message" do
      passed_command = BuildPassedCommand.new
      result = passed_command.execute(double())
      result.should == {success: true}
    end
  end
end
