# PeerstreetGem

Gem to to work with api `https://radiant-garden-37981.herokuapp.com/api/v1/population_estimates`.

It provides `CBSA`, `MSA`, `2014 Population Estimate` and `2014 Population Estimate` for a given `ZIP`.

## Installation

#### Add this line to your application's Gemfile:

```ruby
gem 'peerstreet_gem', :git => 'git@github.com:harshs08/peerstreet_gem.git'
```

And then execute:

    $ bundle

#### Or install it yourself as:

  1. Clone the Git repository.

  `$ git clone git@github.com:harshs08/peerstreet_gem.git`

  2. Change to the new directory.

  `$ cd peerstreet_gem`

  3. Bundle

  `$ bundle install`

  4. Build the gem.

  `$ rake build`

  5. Install the gem.

    `$ gem install pkg/peerstreet_gem-1.0.0.gem`


## Usage

After installation, you can use the gem as:

```
$ api_call = PeerstreetGem::Api.new
$ zip = 32003
$ response = api_call.population_estimates(zip)
$ puts response.response_data
{"Zip":"32003","CBSA":"27260","MSA":"Jacksonville, FL","Pop2015":"1,449,481","Pop2014":"1,421,004"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/harshs08/peerstreet_gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

