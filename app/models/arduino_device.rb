class ArduinoDevice

  TURN_ON_RED_LIGHT = 4
  TURN_OFF_RED_LIGHT = 5
  STROBE_RED_LIGHT = 6

  TURN_ON_YELLOW_LIGHT = 2
  TURN_OFF_YELLOW_LIGHT = 3
  STROBE_YELLOW_LIGHT = 1

  def activate_build_passed
    $serial_port.try(:write, TURN_OFF_RED_LIGHT)
    $serial_port.try(:write, TURN_ON_YELLOW_LIGHT)
  end

  def activate_build_failed
    $serial_port.try(:write, TURN_OFF_YELLOW_LIGHT)
    $serial_port.try(:write, TURN_ON_RED_LIGHT)
  end

  def activate_build_starting
    $serial_port.try(:write, TURN_OFF_RED_LIGHT)
    $serial_port.try(:write, TURN_OFF_YELLOW_LIGHT)
    $serial_port.try(:write, STROBE_YELLOW_LIGHT)
  end

end
