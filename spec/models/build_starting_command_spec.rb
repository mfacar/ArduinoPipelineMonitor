require 'spec_helper'

describe BuildStartingCommand do

  describe "#execute" do

    let(:command) { BuildStartingCommand.new("fake_stage") }

    it "should return success message" do
      result = command.execute(double().as_null_object)
      result.should == {success: true}
    end

    it "should notify device build status is starting" do
      device = double('device')
      device.should_receive(:exec_serial_command).with(PipelineStatus::STARTING, command.stage)
      command.execute(device)
    end

  end

end
