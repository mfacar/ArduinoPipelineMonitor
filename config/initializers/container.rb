require "dim"

ServerContainer = Dim::Container.new

ServerContainer.register(:device) do |c|
  ArduinoDevice.new
end

ServerContainer.register(:validator) do |c|
  Validators::SnapCiValidator.new
end

ServerContainer.register(:command_factory) do |c|
  SnapCiFactory.new(c.validator)
end

ServerContainer.register(:pipeline_agent) do |c|
  PipelineAgent.new(c.command_factory, c.device)
end
