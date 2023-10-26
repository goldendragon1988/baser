# Baser
This gem encode Base10 to any Base depending on the length of your sequence and decode that base depending on the order of your sequence to Base10.
You can select any character you want to include in your sequence and order depending on your liking.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'baser'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ bundle add baser

## Usage

Run:
```ruby
rails g baser:install
```

Note:

  This will generate a file in `config/initializers` called `baser.rb`. Configure baser api here.
  Default Sequence if you don't assign anything is ("0".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a - %w[0 O I l]

```ruby
Baser.setup do |config|
  # NOTE: Your sequence should be array form
  # This is the default characters without 0 0 I l as it is confusing
  # config.charcaters = ("0".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a - %w[0 O I l]
  # config.characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".each_char.map { |c| c }
  # config.characters = "YOUR SEQUENCE HERE"
end
```

Or create file on config/initializer and assign you own characters directly
```
Baser.characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".each_char.map { |c| c }
```

Below we demonstrate the most basic usage of the library:
```ruby
  require "baser"
  Baser.encode(1200) #=> "mG"
  Baser.encode(7653101) #=> "Fe12"

  Baser.decode("mG") #=> 1200
  Baser.decode("Fe12") #=> 7653101
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/goldendragon1988/baser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/goldendragon1988/baser/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Baser project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/goldendragon1988/baser/blob/master/CODE_OF_CONDUCT.md).
