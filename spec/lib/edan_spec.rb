require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'edan.rb')
require 'json'

# Note: for the spec to pass need to have ENV variables set
# TODO: mock backend so we don't need name / pass for tests to pass
# export EDANUSER=name
# export EDANPASS=pass
describe EDANQuery do
  describe "with default params" do
    let (:equery) { EDANQuery.new('rspec-example') }

    it "sets app_id" do
      equery.app_id.should == 'rspec-example'
    end

    it "sets server" do
      equery.server.should == 'http://edan-api.si.edu'
    end

    describe "#sendRequest" do
      it "responds" do
        response = equery.request("start=0&rows=10&wt=json", "/metadataService")
        puts response.inspect
        response.code.should == "200"
        result = JSON.parse(response.body)
        result.keys.should include('response')
      end
    end
  end
end
