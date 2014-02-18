require "spec_helper"
require 'enums/pipeline_status'

describe ArduinoDevice do
  let(:device) { ArduinoDevice.new }
  let(:stage) { "fake_stage" }

  before do
    $serial_port = double('serial', close: nil)
  end

  describe "#exec_serial_command" do
    it "should turn on only yellow light" do
      expected_command = "COMMAND: 1, STAGE: fake_stage"
      $serial_port.should_receive(:try).with(:write, expected_command)
      device.exec_serial_command(PipelineStatus::PASSED, stage)
    end
  end
end
