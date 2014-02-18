require 'enums/pipeline_status'

class BuildStartingCommand < PipelineCommand
  def execute(device)
    device.exec_serial_command(PipelineStatus::STARTING, self.stage)
    return {success: true}
  end
end
