require 'active_support'
require 'active_support/core_ext'

module PeerstreetGem

  class NoZipException < Exception ; end

  class PopulationEstimatesRequest
    attr_reader :zip

    def initialize(zip)
      @zip = zip
      unless @zip.present?
        raise PeerstreetGem::NoZipException, 'No Zip found in the request.'
      end
    end

    def requested_zip
      @zip
    end

  end
end