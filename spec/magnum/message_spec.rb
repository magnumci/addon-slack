require "spec_helper"

describe Magnum::Addons::Slack::Message do
  describe "#initialize" do
    it "requires hash" do
      expect { described_class.new(nil) }.
        to raise_error ArgumentError, "Hash required"
    end
  end

  describe "#to_s" do
    let(:payload) { JSON.load(fixture("build.json")) }
    let(:message) { described_class.new(payload) }
    let(:result)  { message.to_s }

    it "returns a string" do
      expect(result).to be_an String
    end

    it "includes build title" do
      expect(result).to include '[PASS] slack-notify #3 (master - 6f102f22) by Dan Sosedoff'
    end

    it "includes diff message" do
      expect(result).to include "Diff: <https://github.com/sosedoff/slack-notify/compare/42f7b7cdfc4b...6f102f22caac>"
    end

    it "include commit message" do
      expect(result).to include "Commit: <https://github.com/sosedoff/slack-notify/commit/6f102f22caac46945e16ada4f50df29a70ab2799|Version bump: 0.1.1>"
    end

    it "includes author" do
      expect(result).to include "Author: Dan Sosedoff"
    end

    it "includes view build url" do
      expect(result).to include "<https://magnum-ci.com/projects/201/builds/8683|View Build>"
    end
  end
end