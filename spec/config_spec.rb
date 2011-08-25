require File.dirname(__FILE__) + '/spec_helper.rb'
require 'my_amee/config'

class Rails
  def self.root=(root)
    @@root = root
  end
  def self.root
    @@root
  end
  def self.env
    'development'
  end
end

describe MyAmee::Config, "with config file" do

  before :all do 
    Rails.root = File.dirname(__FILE__)
  end

  it "should be able to access config file" do
    config = MyAmee::Config.get
    config['url'].should eql 'https://my-test.amee.com'
    config['secret_key'].should eql 'blah1234'    
  end

end

describe MyAmee::Config, "without config file" do

  before :all do 
    Rails.root = File.dirname(__FILE__) + '/..'
  end

  it "should return nil" do
    log = flexmock "logger" do |mock|
      mock.should_receive(:info).with("WARNING: My AMEE configuration file not found. Copy my_amee.example.yml to config/my_amee.yml and edit.").once
    end
    flexmock(Rails).should_receive(:logger).and_return(log)
    MyAmee::Config.get.should be_nil
  end

end