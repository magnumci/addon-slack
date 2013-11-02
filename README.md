# magnum-addon-slack

[Slack](slack.com) notifier addon for Magnum CI

## Usage

Load:

```ruby
require "magnum/addon/slack"
```

Send notification:

```ruby
addon = Magnum::Addon::Slack.new(team: "team", token: "token")
addon.run(build_payload)
```

## Configuration

Available options:

- `team` - Slack team name (https://<team>.slack.com)
- `token` - Slack access token
- `username` - Notifier username, default is `webhooksbot`
- `channel` - Notifier channel. Default is `#general`