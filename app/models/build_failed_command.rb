class BuildFailedCommand

  def execute(device)
    device.activate_build_failed
    return {success: true}
  end
end
