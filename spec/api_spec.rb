require 'spec_helper'

describe PeerstreetGem::Api do

  before do
    @api = described_class.new
  end
  

  describe "#population_estimates" do
    subject { @api.population_estimates(zip) }

    context "when a valid zip is sent", cassette_name: "_population_estimates_valid" do
      let(:zip) { 32003 }

      it { is_expected.to be_a PeerstreetGem::PopulationEstimatesResponse }

      it "is expected to have 200 status code" do
        expect(subject.response_code).to eq 200
      end

      it "is expected to have json format" do
        expect(subject.response_format).to eq :json
      end

      it "is expected to have response_data" do
        expect(subject.response_data).to eq( {"Zip"=>"32003", "CBSA"=>"27260", 
          "MSA"=>"Jacksonville, FL", "Pop2015"=>"1,449,481", "Pop2014"=>"1,421,004"})
      end

      it "is expected to have zip" do
        expect(subject.zip).to eq "32003"
      end

      it "is expected to have cbsa" do
        expect(subject.cbsa).to eq "27260"
      end

      it "is expected to have msa" do
        expect(subject.msa).to eq "Jacksonville, FL"
      end

      it "is expected to have pop2015" do
        expect(subject.pop2015).to eq "1,449,481"
      end

      it "is expected to have pop2014" do
        expect(subject.pop2014).to eq "1,421,004"
      end
    end

    context "when an invalid zip is sent", cassette_name: "_population_estimates_invalid" do
      let(:zip) { 133424 }

      it { is_expected.to be_a PeerstreetGem::PopulationEstimatesResponse }

      it "is expected to have 200 status code" do
        expect(subject.response_code).to eq 200
      end

      it "is expected to have json format" do
        expect(subject.response_format).to eq :json
      end

      it "is expected to have response_data" do
        expect(subject.response_data).to eq( {"Zip"=>"133424", "CBSA"=>"N/A", 
          "MSA"=>"N/A", "Pop2015"=>"N/A", "Pop2014"=>"N/A"})
      end

      it "is expected to have zip" do
        expect(subject.zip).to eq "133424"
      end

      it "is expected to have no cbsa" do
        expect(subject.cbsa).to eq "N/A"
      end

      it "is expected to have no msa" do
        expect(subject.msa).to eq "N/A"
      end

      it "is expected to have no pop2015" do
        expect(subject.pop2015).to eq "N/A"
      end

      it "is expected to have no pop2014" do
        expect(subject.pop2014).to eq "N/A"
      end
    end

    context "when an empty zip is sent", cassette_name: "_population_estimates_empty" do
      let(:zip) { "" }

      it "raises PeerstreetGem::PopulationEstimatesRequest" do
        expect { subject }.to raise_exception(PeerstreetGem::NoZipException, 'No Zip found in the request.')
      end
    end
  end
end