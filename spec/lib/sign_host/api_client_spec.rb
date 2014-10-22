require 'spec_helper'

describe SignHost::ApiClient do
  it 'parses the response' do
    stub_transaction_request_with_status(200)
    parsed_response = SignHost::ApiClient.new($configuration).post_transaction({})
    expect(parsed_response.class).to eq(Hash)
  end

  it 'raises an error when something went wrong' do
    stub_transaction_request_with_status(401)
    expect{SignHost::ApiClient.post_transaction({})}.to raise_error
  end

  def stub_transaction_request_with_status(status)
    stub_request(:post, "https://api.signhost.com/api/transaction").
      with(:body => "{}",
           :headers => {'Accept'=>'application/json',
                        'Accept-Encoding'=>'gzip, deflate',
                        'Application'=>"APPKey your app name your app key",
                        'Authorization'=>"APIKey your api key",
                        }).
      to_return(:status => status, :body => load_signhost_fixture("successful_new_transaction"), :headers => {})
  end
end
