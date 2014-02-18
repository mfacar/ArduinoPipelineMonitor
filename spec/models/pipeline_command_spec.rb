require "spec_helper"

describe PipelineCommand do
  describe "initialize" do
    it "should have a stage" do
      command = BuildPassedCommand.new("fake_stage")
      command.stage.blank?.should_not == true
    end
  end
end


