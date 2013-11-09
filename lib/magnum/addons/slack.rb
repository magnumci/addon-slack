require "magnum/addons/slack/version"
require "magnum/addons/slack/message"

require "slack-notify"
require "hashr"

module Magnum
  module Addons
    class Slack
      def initialize(options={})
        team  = options.delete(:team)
        token = options.delete(:token)

        # Set default username, otherwise webhookbot
        options[:username] ||= "magnum-ci"

        @client = SlackNotify::Client.new(team, token, options)
      end

      def run(build)
        message = Message.new(build)
        deliver(message.to_s)
      end

      private

      def deliver(message)
        @client.notify(message)
      end
    end
  end
end
