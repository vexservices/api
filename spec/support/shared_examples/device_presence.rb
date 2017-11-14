RSpec.shared_examples "validate devise token" do
  it "return 200" do
    valid_url

    expect(response.status).to eq 200
    expect(response).to match_response_schema(json_schema)
  end

  it "return 404" do
    invalid_url

    expect(response.status).to eq 404
    expect(json[:message]).to eq('Invalid device token')
  end
end
