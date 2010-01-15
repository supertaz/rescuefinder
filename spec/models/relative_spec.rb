require File.dirname(__FILE__) + '/../spec_helper'

describe Relative do
  it "should be valid" do
    Relative.new.should be_valid
  end
end
