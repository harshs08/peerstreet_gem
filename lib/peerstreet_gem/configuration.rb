module PeerstreetGem
  class Configuration
    DEFAULT_HOST = "https://radiant-garden-37981.herokuapp.com".freeze
    DEFAULT_LOG_FILE = "log/httparty.log".freeze

    include HTTParty

    def self.configure &config_blk
      yield self if block_given?
    end

    base_uri DEFAULT_HOST
    logger ::Logger.new(DEFAULT_LOG_FILE)

  end
end