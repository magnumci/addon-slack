require "magnum/addon/slack/version"
require "slack-notify"
require "hashr"

module Magnum
  module Addon
    class Slack
      def initialize(options={})
        team  = options.delete(:team)
        token = options.delete(:token)

        @client = SlackNotify::Client.new(team, token, options)
      end

      def run(build)
        unless build.kind_of?(Hash)
          raise "Hash required"
        end

        deliver(format_message(Hashr.new(build)))
      end

      private

      def deliver(message)
        @client.notify(message)
      end

      def format_message(build)
        lines = [
          build.title,
          "Commit: <#{build.commit_url}|#{build.message}>"
        ]

        if build.compare_url
          lines << "Diff: <#{build.compare_url}>"
        end

        lines << "Author: #{build.author}"
        lines << "Duration: #{build.duration_string}"

        lines.join("\n")
      end
    end
  end
end
