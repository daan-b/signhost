module SignHost::PayloadCreator

  def self.create(hash)
    build_hash(hash)
  end

  private

  def self.build_hash(hash)
    hash.assert_valid_keys(:file, :seal, :signers, :reference, :postback_url, :send_email_notifications)
    hash.require_keys(:file, :signers)
    hash[:file].assert_valid_keys(:name)
    hash[:file].require_keys(:name)

    {
      File: {Name: hash[:file][:name]},
      Seal: hash[:seal],
      Signers: inject_signers(hash[:signers]),
      Reference: hash[:reference],
      PostbackUrl: hash[:postback_url],
      SendEmailNotifications: hash[:send_email_notifications]
    }.reject{|k,v| v.nil?}
  end

  def self.inject_signers(signers)
    signers.collect do |hash|
      hash.assert_valid_keys(:email, :mobile, :require_sms_verification, :send_sign_request, :sign_request_message, :language, :reference, :return_url)
      hash.require_keys(:email)
      hash.require_keys(:sign_request_message) if hash[:send_sign_request]

      {
        Email: hash[:email],
        Mobile: hash[:mobile],
        RequireSmsVerification: hash[:require_sms_verification],
        SendSignRequest: hash[:send_sign_request],
        SignRequestMessage: hash[:sign_request_message],
        Language: hash[:language],
        Reference: hash[:reference],
        ReturnUrl: hash[:return_url]
      }.reject{|k,v| v.nil?}
    end

  end
end
