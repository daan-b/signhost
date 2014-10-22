module SignHost
  class ApiClient
    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def post_transaction(payload)
      RestClient.post(new_transaction_url, payload.to_json, auth_headers.merge(content_type: 'application/json', accept: 'application/json')){ |response, request, result, &block|
        case response.code
        when 200
          JSON.parse(response.body)
        else
          response.return!(request, result, &block)
        end
      }
    end

    def put_file(file_id, file)
      RestClient.put(upload_file_url(file_id), file, auth_headers.merge(multipart: true, content_type: 'application/pdf')) { |response, request, result, &block |
        case response.code
        when 200
          true
        else
          response.return!(request, result, &block)
        end
      }
    end

    def get_transaction(transaction_id)
      RestClient.get(transaction_url(transaction_id), auth_headers.merge(content_type: 'application/json', accept: 'application/json')){ |response, request, result, &block |
        case response.code
        when 200
          JSON.parse(response.body)
        else
          response.return!(request, result, &block)
        end
      }
    end

    private

    def new_transaction_url
      api_url + "transaction"
    end

    def upload_file_url(file_id)
      api_url + "file/" + file_id
    end

    def transaction_url(transaction_id)
      api_url + "transaction/" + transaction_id
    end

    def api_url
      "https://api.signhost.com/api/"
    end

    def auth_headers
      {
        authorization: "APIKey #{configuration.api_key}",
        application: "APPKey #{configuration.application_key}"
      }
    end

  end
end
