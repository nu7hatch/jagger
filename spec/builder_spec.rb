require File.expand_path('../spec_helper', __FILE__)

describe Jagger::Builder do
  describe "initialization" do
    it "configures sinatra app" do
      app = Jagger::Builder.new { set :public_folder, 'test' }
      app.app.public_folder.should == 'test'
    end

    it "registers assets paths" do
      paths = %w(test/)
      Jagger::Assets.any_instance.expects(:append_paths).with(paths)
      app = Jagger::Builder.new { set :asset_paths, paths }
    end
  end

  describe "integration" do
    let :app do
      Jagger::Builder.new do
        set :asset_paths, [File.expand_path('../fixtures/src/', __FILE__)]
        set :views, File.expand_path('../fixtures/templates/', __FILE__)
      end
    end

    it "serves index page" do
      get '/'
      last_response.body.should == 'Hello Jagger!'
    end

    it "serves assets" do
      get '/assets/one.js'
      last_response.body.strip.should == "alert('hello!');"
    end
  end
end
