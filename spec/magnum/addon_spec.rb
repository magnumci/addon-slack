require "spec_helper"

describe Magnum::Addon::Slack do
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
end