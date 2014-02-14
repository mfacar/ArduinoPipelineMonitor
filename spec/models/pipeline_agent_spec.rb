require 'spec_helper'

describe PipelineAgent do

  describe "#process_status_update" do
    let(:valid_request) { {"monitor"=>{"project_name"=>"ernezto/feelme_server", "stage_name"=>"FastFeedback", "counter"=>36, "build_result"=>"Passed"}} }
    let(:pipeline_agent) { ServerContainer.pipeline_agent }

    it "should create command according the monitor status" do
      factory = double()
      command = double().as_null_object
      factory.should_receive(:create_command_from_request).with(valid_request).and_return(command)
      pipeline_agent = PipelineAgent.new(factory, double().as_null_object)
      pipeline_agent.process_status_update(valid_request)
    end

    it "should execute command according the monitor status" do
      factory = double()
      command = double()
      device = double()
      factory.stub(:create_command_from_request).and_return(command)
      command.should_receive(:execute).with(device)

      pipeline_agent = PipelineAgent.new(factory, device)

      pipeline_agent.process_status_update(valid_request)
    end
  end

end
