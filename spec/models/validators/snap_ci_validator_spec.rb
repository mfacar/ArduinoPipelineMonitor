require 'spec_helper'

describe Validators::SnapCiValidator do

  describe "#is_valid?" do
    let(:valid_request) { {"monitor"=>{"project_name"=>"ernezto/feelme_server", "stage_name"=>"FastFeedback", "counter"=>36, "build_result"=>"passed"}} }
    let(:validator) { Validators::SnapCiValidator.new }

    it "should return true when the request is valid" do
      validator.request_info = valid_request
      result = validator.is_valid?
      result.should be_true
    end

    it "should return false when the request is invalid" do
      validator.request_info = {}
      result = validator.is_valid?
      result.should be_false
    end

    it "should have errors when monitor key is not present" do
      validator.request_info = {"example"=>{}}
      validator.is_valid?
      expect(validator.errors).to include({"monitor"=>"hash required"})
    end

    it "should have errors when stage_name key is not present" do
      validator.request_info = {"monitor"=>{"pepe"=>""}}
      validator.is_valid?
      expect(validator.errors["monitor"]).to include({"stage_name"=>"string required"})
    end

    it "should have errors when build_result key is not present" do
      validator.request_info = {"monitor"=>{"stage_name"=>""}}
      validator.is_valid?
      expect(validator.errors["monitor"]).to include({"build_result"=>"string required"})
    end

    it "should accept to pass the request as a property accessor" do
      validator.request_info = valid_request
      validator.request_info.should == valid_request
    end
  end
end
