require "spec_helper"

describe ArduinoDevice do
  let(:device) { ArduinoDevice.new }

  before do
    $serial_port = double('serial', close: nil)
  end

  describe "#turn_on_red_light" do

    it "should turn on the red light" do
      $serial_port.should_receive(:write).with(ArduinoDevice::TURN_ON_RED_LIGHT)
      device.turn_on_red_light
    end

    it "should handle exception if serial port is invalid" do
      $serial_port = nil
      device.turn_on_red_light
    end
  end

  describe "#turn_off_red_light" do

    it "should turn off the red light" do
      $serial_port.should_receive(:write).with(ArduinoDevice::TURN_OFF_RED_LIGHT)
      device.turn_off_red_light
    end

    it "should handle exception if serial port is invalid" do
      $serial_port = nil
      device.turn_off_red_light
    end
  end

  describe "#strobe_red_light" do

    it "should strobe the red light" do
      $serial_port.should_receive(:write).with(ArduinoDevice::STROBE_RED_LIGHT)
      device.strobe_red_light
    end

    it "should handle exception if serial port is invalid" do
      $serial_port = nil
      device.strobe_red_light
    end
  end

  describe "#turn_on_yellow_light" do

    it "should turn on the yellow light" do
      $serial_port.should_receive(:write).with(ArduinoDevice::TURN_ON_YELLOW_LIGHT)
      device.turn_on_yellow_light
    end

    it "should handle exception if serial port is invalid" do
      $serial_port = nil
      device.turn_on_yellow_light
    end
  end

  describe "#turn_off_yellow_light" do

    it "should turn off the yellow light" do
      $serial_port.should_receive(:write).with(ArduinoDevice::TURN_OFF_YELLOW_LIGHT)
      device.turn_off_yellow_light
    end

    it "should handle exception if serial port is invalid" do
      $serial_port = nil
      device.turn_off_yellow_light
    end
  end

  describe "#strobe_yellow_light" do

    it "should strobe the yellow light" do
      $serial_port.should_receive(:write).with(ArduinoDevice::STROBE_YELLOW_LIGHT)
      device.strobe_yellow_light
    end

    it "should handle exception if serial port is invalid" do
      $serial_port = nil
      device.strobe_yellow_light
    end
  end
end
