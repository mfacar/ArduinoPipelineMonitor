
$serial_port = SerialPort.new("/dev/tty.usbserial-AM01PLBB", 9600) rescue nil

at_exit do
  $serial_port.try(&:close)
end
