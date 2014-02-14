require 'spec_helper'

describe InvalidRequestCommand do

  describe "#execute" do
    it "should return failed message" do
      invalid_command = InvalidRequestCommand.new
      result = invalid_command.execute(double())
      result.should == {success: false}
    end
  end

end
