class BuildStartingCommand
  def execute(device)
    device.activate_build_starting
    return {success: true}
  end
end
