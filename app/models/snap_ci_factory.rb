class SnapCiFactory

  def initialize(validator)
    @validator = validator
    @commands = { "PASSED" => BuildPassedCommand,
                  "FAILED" => BuildFailedCommand,
                  "STARTING" => BuildStartingCommand }
  end

  def create_command_from_request(request)
    return InvalidRequestCommand.new unless is_valid_request?(request)
    build_status = request['monitor']['build_result'].upcase
    command = @commands[build_status].new(request['monitor']['stage_name'])
    return command
  end

  private
  def is_valid_request?(request)
    @validator.request_info = request
    @validator.is_valid?
  end
end
