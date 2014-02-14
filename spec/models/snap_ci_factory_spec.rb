require "spec_helper"

describe SnapCiFactory do
  describe "#create_command_from_request" do
    let(:factory) { ServerContainer.command_factory }

    it "should return invalid command when request is not valid" do
      invalid_request = {}
      command = factory.create_command_from_request(invalid_request)
      command.should be_instance_of(InvalidRequestCommand)
    end

    it "should return build passed command when build status is passed" do
      passed_build = {"monitor"=>{"project_name"=>"ernezto/feelme_server", "stage_name"=>"FastFeedback", "counter"=>36, "build_result"=>"Passed"}}
      command = factory.create_command_from_request(passed_build)
      command.should be_instance_of(BuildPassedCommand)
    end

    it "should return build failed command when build status is failed" do
      failed_build = {"monitor"=>{"project_name"=>"ernezto/feelme_server", "stage_name"=>"FastFeedback", "counter"=>36, "build_result"=>"Failed"}}
      command = factory.create_command_from_request(failed_build)
      command.should be_instance_of(BuildFailedCommand)
    end
  end
end