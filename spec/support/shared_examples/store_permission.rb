RSpec.shared_examples "validate store permission" do
  it "return 200" do
    valid_url

    expect(response.status).to eq 200
    expect(response).to match_response_schema(json_schema)
  end

  it "return 401" do
    invalid_url

    expect(response.status).to eq 401
    expect(json[:message]).to eq('Not allowed to perform this action')
  end
end
