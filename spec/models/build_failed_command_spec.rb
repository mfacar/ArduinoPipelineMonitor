require "spec_helper"

describe BuildFailedCommand do
  describe "#execute" do
    let(:command) { BuildFailedCommand.new("fake_stage") }

    it "should return success message" do
      result = command.execute(double().as_null_object)
      result.should == {success: true}
    end

    it "should notify device failed status" do
      device = double('device')
      device.should_receive(:exec_serial_command).with(PipelineStatus::FAILED, command.stage)
      command.execute(device)
    end
  end
end
