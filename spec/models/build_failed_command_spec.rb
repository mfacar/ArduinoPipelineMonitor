require "spec_helper"

describe BuildFailedCommand do
  describe "#execute" do
    let(:command) { BuildFailedCommand.new }

    it "should return success message" do
      result = command.execute(double().as_null_object)
      result.should == {success: true}
    end

    it "should notify device failed status" do
      device = double('device')
      device.should_receive(:activate_build_failed)
      command.execute(device)
    end
  end
end
