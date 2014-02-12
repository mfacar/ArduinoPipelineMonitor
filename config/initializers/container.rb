require "dim"
require "snap_ci_monitor_service"

ServerContainer = Dim::Container.new

ServerContainer.register(:monitor_service) do |c|
  SnapCIMonitorService.new
end
