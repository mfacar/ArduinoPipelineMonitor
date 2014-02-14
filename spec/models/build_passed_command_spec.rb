require 'spec_helper'

describe BuildPassedCommand do
  describe "#execute" do

    let(:passed_command) { BuildPassedCommand.new }

    it "should return success message" do
      result = passed_command.execute(double().as_null_object)
      result.should == {success: true}
    end

    it "should notify device of success status" do
      device = double('device')
      device.should_receive(:activate_build_passed)
      result = passed_command.execute(device)
    end

  end
end
