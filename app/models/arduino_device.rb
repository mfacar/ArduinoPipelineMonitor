class ArduinoDevice
  def exec_serial_command(command, stage)
    serial_command = "COMMAND: #{command}, STAGE: #{stage}"
    $serial_port.try(:write, serial_command)
  end
end
