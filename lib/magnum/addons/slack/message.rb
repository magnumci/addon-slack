module Magnum
  module Addons
    class Slack
      class Message
        attr_reader :build

        def initialize(build)
          unless build.kind_of?(Hash)
            raise ArgumentError, "Hash required"
          end

          @build = Hashr.new(build)
        end

        def to_s
          lines = [
            build.title,
            "Commit: <#{build.commit_url}|#{build.message}>"
          ]

          if build.compare_url
            lines << "Diff: <#{build.compare_url}>"
          end

          lines << "Author: #{build.author}"
          lines << "<#{build.build_url}|View Build>"

          lines.join("\n")
        end
      end
    end
  end
end