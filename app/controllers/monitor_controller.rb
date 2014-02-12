class MonitorController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    ServerContainer.monitor_service.test
    p params
    Rails.logger.info("llamado")
    render json: {success:true}
  end

  def new

    Rails.logger.info("llamado")
    render json: {success:true}
  end
end
