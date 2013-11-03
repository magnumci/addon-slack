require "spec_helper"

describe Magnum::Addons::Slack do
  let(:options) do
    { team: "team", token: "token" }
  end

  let(:payload) { JSON.load(fixture("build.json")) }

  describe "#run" do
    let(:addon) { described_class.new(options) }

    it "requires hash argument" do
      expect { addon.run(nil) }.to raise_error "Hash required"
    end

    it "sends notification to channel" do
      expect(addon).to receive(:deliver).with fixture("success.txt")
      addon.run(payload)
    end
  end

  describe "#deliver" do
    let(:addon) { described_class.new(options) }

    before do
      SlackNotify::Client.any_instance.stub(:notify) { true }
    end

    it "sends payload" do
      result = addon.send(:deliver, fixture("success.txt"))
      expect(result).to eq true
    end
  end
end