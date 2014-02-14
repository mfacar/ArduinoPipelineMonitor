require "spec_helper"

describe ArduinoDevice do
  let(:device) { ArduinoDevice.new }

  before do
    $serial_port = double('serial', close: nil)
  end

  describe "#activate_build_passed" do
    it "should turn on only yellow light" do
      $serial_port.should_receive(:try).once.ordered.with(:write, ArduinoDevice::TURN_OFF_RED_LIGHT)
      $serial_port.should_receive(:try).once.ordered.with(:write, ArduinoDevice::TURN_ON_YELLOW_LIGHT)
      device.activate_build_passed
    end
  end

  describe "#activate_build_failed" do
    it "should turn on only red light" do
      $serial_port.should_receive(:try).once.ordered.with(:write, ArduinoDevice::TURN_OFF_YELLOW_LIGHT)
      $serial_port.should_receive(:try).once.ordered.with(:write, ArduinoDevice::TURN_ON_RED_LIGHT)
      device.activate_build_failed
    end
  end

  describe "#activate_build_starting" do
    it "should strobe yellow light" do
      $serial_port.should_receive(:try).once.ordered.with(:write, ArduinoDevice::TURN_OFF_RED_LIGHT)
      $serial_port.should_receive(:try).once.ordered.with(:write, ArduinoDevice::TURN_OFF_YELLOW_LIGHT)
      $serial_port.should_receive(:try).once.ordered.with(:write, ArduinoDevice::STROBE_YELLOW_LIGHT)
      device.activate_build_starting
    end
  end
end
