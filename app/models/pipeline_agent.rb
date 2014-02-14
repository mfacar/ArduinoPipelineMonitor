class PipelineAgent

  def initialize(factory, device)
    @factory = factory
    @device = device
  end

  def process_status_update(request_info)
    command = @factory.create_command_from_request(request_info)
    return command.execute(@device)
  end

end
