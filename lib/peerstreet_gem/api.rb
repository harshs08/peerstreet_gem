module PeerstreetGem
  class Api

    def population_estimates(zip)
      requested_zip = PopulationEstimatesRequest.new(zip).requested_zip
      get "/population_estimates/#{requested_zip}"
    end

    private

    def get(path)
      PopulationEstimatesResponse.new(raw_get(path))
    end

    def raw_get(path)
      Configuration.get("#{base_api_path}#{path}")
    end

    def base_api_path
      "/api/v1"
    end

  end
end