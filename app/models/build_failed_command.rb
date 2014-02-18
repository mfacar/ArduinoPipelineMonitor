class BuildFailedCommand < PipelineCommand

  def execute(device)
    device.exec_serial_command(PipelineStatus::FAILED, self.stage)
    return {success: true}
  end
end
