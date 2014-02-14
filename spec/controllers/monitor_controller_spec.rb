require "spec_helper"

describe MonitorController do
  describe "POST update status" do
    let(:agent) { double("agent", process_update: nil) }

    before(:each) do
      ServerContainer.stub(:pipeline_agent).and_return(agent)
    end

    it "should send receive params to monitor service" do
      params = {status: 'passed'}
      ServerContainer.pipeline_agent
        .should_receive(:process_update)
        .with(hash_including(params))
      post :update_status, params
    end

    it "should respond with ok message after call" do
      post :update_status, {}
      expect(response.body).to eq('{"success":true}')
    end
  end
end
