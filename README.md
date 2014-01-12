# Slack Addon

Send [Magnum CI](http://magnum-ci.com) build notifications to a [Slack](http://slack.com) channel

![Build Status](https://magnum-ci.com/status/3c4493d923cf28c3aae0691fc6754965.png)

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

The MIT License (MIT)

Copyright (c) 2013-2014 Dan Sosedoff, <dan.sosedoff@gmail.com>