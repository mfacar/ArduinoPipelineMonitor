class BuildPassedCommand < PipelineCommand
  def execute(device)
    device.exec_serial_command(PipelineStatus::PASSED, self.stage)
    return {success: true}
  end
end
