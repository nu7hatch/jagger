require File.expand_path('../spec_helper', __FILE__)

describe Jagger::App do
  describe "#mock_requests?" do
    it "returns true when requests should be mocked" do
      #ENV['USE_REAL_REQUESTS'] = '0'
      #subject.should be_mock_requests
    end

    it "returns false when requests should not be mocked" do
      #ENV['USE_REAL_REQUESTS'] = '1'
      #subject.should_not be_mock_requests
    end
  end

  it "has proper default configuration" do
    app = Jagger::App
    app.asset_paths == %w(src/main/ src/test/ src/look/ lib/)
    app.public_folder.should == 'static'
    app.views.should == 'templates'
    app.layout.should_not be
  end

  describe "integration" do
    let :app do
      base = Class.new(Jagger::App)
      base.set :views, File.expand_path('../fixtures/templates/', __FILE__)
      base.new
    end
    
    it "serves index page" do
      get '/'
      last_response.body.should == 'Hello Jagger!'
    end
  end
end
