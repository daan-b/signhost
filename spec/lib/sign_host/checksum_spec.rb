require 'spec_helper'

describe SignHost::Checksum do
  it 'validates the checksum from the given params' do
    postback_json = JSON.parse(load_signhost_fixture("postback_transaction"))
    expect(SignHost::Checksum.new($configuration).create(postback_json['Id'], postback_json['File']['Id'], postback_json['Status'])).to eq(postback_json["Checksum"])
  end

end
