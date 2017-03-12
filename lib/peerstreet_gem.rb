require 'logger'
require 'httparty'

require 'peerstreet_gem/version'
require 'peerstreet_gem/configuration'
require 'peerstreet_gem/api'
require 'peerstreet_gem/population_estimates_request'
require 'peerstreet_gem/population_estimates_response'

module PeerstreetGem
  class << self
  extend Forwardable
  def_delegator PeerstreetGem::Configuration, :configure
end
end
