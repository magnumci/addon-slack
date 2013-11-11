require "spec_helper"

describe Magnum::Addons::Slack do
  let(:payload) { JSON.load(fixture("build.json")) }
  let(:options) { Hash(team: "team", token: "token") }

  describe "#initialize" do
    it "requires team name" do
      expect { described_class.new }.
        to raise_error Magnum::Addons::Slack::Error, "Team name required"
    end

    it "requires token" do
      expect { described_class.new(team: "team") }.
        to raise_error Magnum::Addons::Slack::Error, "Token required"
    end

    context "with valid arguments" do
      it "does not raise error" do
        expect { described_class.new(options) }.
          not_to raise_error
      end
    end
  end

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