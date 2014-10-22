require "sign_host"
require "webmock/rspec"

require_relative "support/signhost_helper"

$configuration = SignHost::Configuration.new({
  api_key: "your api key",
  app_name: "your app name",
  app_key: "your app key",
  shared_secret: "your shared secret"
})

RSpec.configure do |config|
  config.include SignhostHelper
end
