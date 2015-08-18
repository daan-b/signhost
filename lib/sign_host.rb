require 'rubygems'
require 'bundler/setup'
require 'json'
require 'rest-client'
require 'active_support/core_ext/hash/keys'

class Hash
  def require_keys(*keys)
    raise ArgumentError, "#{keys.reject{|k| key?(k)}.inspect} are missing" unless keys.all?{|k| key?(k)}
  end
end

module SignHost
end

require 'sign_host/api_client'
require 'sign_host/checksum'
require 'sign_host/configuration'
require 'sign_host/payload_creator'
require 'sign_host/status'
require 'sign_host/version'
