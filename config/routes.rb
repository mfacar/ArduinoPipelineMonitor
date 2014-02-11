PipelineMonitor::Application.routes.draw do
    post 'create_monitor', to: 'monitor#create'
    resources :monitor, only: [ :new, :create ]
end
