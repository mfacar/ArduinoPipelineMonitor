PipelineMonitor::Application.routes.draw do
    post 'update_status', to: 'monitor#update_status'
end
