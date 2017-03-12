module PeerstreetGem
  class PopulationEstimatesResponse
    attr_reader :raw_response, :response_code, :response_format, :response_data,
      :zip, :cbsa, :msa, :pop2015, :pop2014

    def initialize(raw_response)
      set_response_attributes(raw_response)
    end

    def response_data
      @response_data ||= JSON.parse(@raw_response_data)
    end

    private

    def set_response_attributes(raw_response)
      @raw_response      = raw_response
      @response_code     = raw_response.code
      @response_format   = content_type
      @raw_response_data = @raw_response.body
      @zip               = response_data['Zip']
      @cbsa              = response_data['CBSA']
      @msa               = response_data['MSA']
      @pop2015           = response_data['Pop2015']
      @pop2014           = response_data['Pop2014']
    end


    def content_type
      if raw_response.headers['content-type'] == "application/json"
        :json
      else
        :unsupported
      end
    end
  end
end