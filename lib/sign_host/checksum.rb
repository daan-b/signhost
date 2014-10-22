module SignHost
  class Checksum
    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def create(transaction_id, file_id, status)
      create_checksum(transaction_id, file_id, status)
    end

    private

    def create_checksum(transaction_id, file_id, status)
      Digest::SHA1.hexdigest("#{transaction_id}|#{file_id}|#{status}|#{configuration.shared_secret}")
    end
  end
end
