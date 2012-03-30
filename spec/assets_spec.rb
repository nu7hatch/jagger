require File.expand_path('../spec_helper', __FILE__)

describe Jagger::Assets do
  describe "#append_paths" do
    it "registers specified paths under the sprockets instance" do
      Sprockets::Environment.any_instance.tap do |env|
        env.expects(:append_path).with('foo/')
        env.expects(:append_path).with('bar/')
      end
      subject.append_paths(%w(foo/ bar/))
    end
  end

  describe "#call" do
    it "serves assets via sprockets pipeline" do
      env = { :hello => 'world' }
      Sprockets::Environment.any_instance.expects(:call).with(env)
      subject.call(env)
    end
  end
end
