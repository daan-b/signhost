require 'spec_helper'

describe SignHost::PayloadCreator do
  it 'creates a json representation from a contract' do
    contract = build_contract
    json_contract = SignHost::PayloadCreator.create(contract)
    expect(json_contract).to eq(expected_payload_with_signers(0))
  end

  it 'creates a json representation with one signer' do
    contract = build_contract
    contract[:signers] << signer_hash

    json_contract = SignHost::PayloadCreator.create(contract)
    expect(json_contract).to eq(expected_payload_with_signers(1))
  end

  it 'creates a json representation with two signers' do
    contract = build_contract
    contract[:signers] << signer_hash
    contract[:signers] << signer_hash

    json_contract = SignHost::PayloadCreator.create(contract)
    expect(json_contract).to eq(expected_payload_with_signers(2))
  end

  it 'creates a json representation with a partial contract' do
    contract = {reference: 'Contract #1', file: {name: 'some_contract.pdf'}, :signers => []}
    json_contract = SignHost::PayloadCreator.create(contract)
    expect(json_contract).to eq({:File => {:Name=>"some_contract.pdf"}, :Reference => "Contract #1", :Signers => []})
  end

  def expected_payload_with_signers(times)
    signers_payload = []
    times.to_i.times do
      signers_payload << signer_payload
    end
    { File: {Name: "some_contract.pdf"},
      Seal: true,
      Reference: "Contract #1",
      PostbackUrl: "localhost:3000/contracts/update",
      Signers: signers_payload
    }
  end

  def signer_payload
    {
      Email: 'user@email.com',
      Mobile: '06555',
      RequireScribble: true,
      RequireSmsVerification: true,
      SendSignRequest: true,
      Reference: true,
      ReturnUrl: true,
      SignRequestMessage: "please sign"
    }
  end

  def build_contract
    {reference: 'Contract #1', file: {name: 'some_contract.pdf'}, seal: true, postback_url: "localhost:3000/contracts/update", :signers => []}
  end

  def signer_hash
    { email: "user@email.com", mobile: '06555', require_scribble: true, require_sms_verification: true, send_sign_request: true, :sign_request_message => "please sign", reference: true, return_url: true }
  end
end
