require "sign_host"
require "webmock/rspec"

require_relative "support/signhost_helper"

$configuration = SignHost::Configuration.new({
  api_key: "78lB6t3E8wv4n0mRXFU4iMNPF6mWg2yz",
  app_name: "Bettyblocks",
  app_key: "ziGoai8ldHamn6tSQFo7GlH5ORHiDd3P",
  shared_secret: "xeIfAhOpONoKGJfsYDuRN24L4wUMhyUp"
})

RSpec.configure do |config|
  config.include SignhostHelper
end
