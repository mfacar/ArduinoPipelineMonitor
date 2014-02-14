require 'spec_helper'

describe PipelineAgent do

  describe "#process_status_update" do
    let(:valid_request) { {"monitor"=>{"project_name"=>"ernezto/feelme_server", "stage_name"=>"FastFeedback", "counter"=>36, "build_result"=>"Passed"}} }
    let(:invalid_request) { {"invalid_parameter"=>{"project_name"=>""}} }
    let(:mediator) { ServerContainer.pipeline_agent }

    it "should return success message if request is valid" do
      result = mediator.process_status_update(valid_request)
      result.should == {success: true}
    end

    it "should return success false if request is not valid" do
      result = mediator.process_status_update(invalid_request)
      result.should == {success: false}
    end

    xit "should update the device status according the monitor status" do
      ArduinoDevice.any_instance.should_receive(:update).with(Enums::PipelineStatus::PASSED)
      mediator.process_status_update(valid_request)
    end
  end

end
