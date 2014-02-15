class SnapCiFactory

  def initialize(validator)
    @validator = validator
    @commands = { "PASSED" => BuildPassedCommand.new, 
                  "FAILED" => BuildFailedCommand.new, 
                  "STARTING" => BuildStartingCommand.new }
  end

  def create_command_from_request(request)
    return InvalidRequestCommand.new unless is_valid_request?(request)
    build_status = request['monitor']['build_result'].upcase
    return @commands[build_status]
  end

  private

  def is_valid_request?(request)
    @validator.request_info = request
    @validator.is_valid?
  end
end
