class MonitorController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def update_status
    monitor = ServerContainer.pipeline_agent
    puts "*"*100
    p params
    puts "*"*100
    monitor.process_status_update(params)
    render json: {success:true}
  end

end
