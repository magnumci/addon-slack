require "magnum/addons/slack/version"
require "magnum/addons/slack/error"
require "magnum/addons/slack/message"

require "slack-notify"
require "hashr"

module Magnum
  module Addons
    class Slack
      def initialize(options = {})
        @team  = options[:team]
        @token = options[:token]

        validate_options
      end

      def run(build)
        message = Message.new(build)
        deliver(message.to_s)
      end

      private

      def validate_options
        raise Error, "Team name required" if @team.nil?
        raise Error, "Token required"     if @token.nil?
      end

      def client
        @client ||= SlackNotify::Client.new(@team, @token, username: "magnum-ci")
      end

      def deliver(message)
        client.notify(message)
      end
    end
  end
end
