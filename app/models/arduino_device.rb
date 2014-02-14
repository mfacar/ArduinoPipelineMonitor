class ArduinoDevice

  TURN_ON_RED_LIGHT = 4
  TURN_OFF_RED_LIGHT = 5
  STROBE_RED_LIGHT = 6

  TURN_ON_YELLOW_LIGHT = 2
  TURN_OFF_YELLOW_LIGHT = 3
  STROBE_YELLOW_LIGHT = 1

  def turn_on_red_light
    $serial_port.try(:write, TURN_ON_RED_LIGHT)
  end

  def turn_off_red_light
    $serial_port.try(:write, TURN_OFF_RED_LIGHT)
  end

  def strobe_red_light
    $serial_port.try(:write, STROBE_RED_LIGHT)
  end

  def turn_on_yellow_light
    $serial_port.try(:write, TURN_ON_YELLOW_LIGHT)
  end

  def turn_off_yellow_light
    $serial_port.try(:write, TURN_OFF_YELLOW_LIGHT)
  end

  def strobe_yellow_light
    $serial_port.try(:write, STROBE_YELLOW_LIGHT)
  end
end
