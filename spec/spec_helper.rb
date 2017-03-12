$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "peerstreet_gem"

require 'byebug'
require "vcr"
require "webmock"

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
end

RSpec.configure do |config|

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.warnings = true

  # The below automagically records requests for every spec
  # Copied from a gist on github,
  # see: https://github.com/vcr/vcr/wiki/Automatically-record-all-remote-calls-(with-RSpec)
  config.around(:each) do |example|
    options = example.metadata[:vcr] || {}
    if options[:record] == :skip
      VCR.turned_off(&example)
    else
      name = example.metadata[:cassette_name] || example.metadata[:full_description].split(/\s+/, 2).join('/').underscore.gsub(/\./,'/').gsub(/[^\w\/]+/, '_').gsub(/\/$/, '')
      VCR.use_cassette(name, options, &example)
    end
  end

  config.order = :random

  Kernel.srand config.seed
end
