class BuildPassedCommand
  def execute(device)
    device.activate_build_passed
    return {success: true}
  end
end
