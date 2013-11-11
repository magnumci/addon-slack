# Slack Addon

Send [Magnum CI](http://magnum-ci.com) build notifications to a [Slack](http://slack.com) channel

## Usage

Example:

```ruby
require "magnum/addons/slack"

# Initialize addon
addon = Magnum::Addon::Slack.new(team: "team", token: "token")

# Send build payload
addon.run(build_payload)
```

## Configuration

Available options:

- `team`     - Slack team name (https://TEAM.slack.com)
- `token`    - Slack access token
- `channel`  - Notifier channel. Default is `#general`

## Testing

Execute test suite:

```
bundle exec rake test
```

## License

Copyright (c) 2013 Magnum CI

MIT License