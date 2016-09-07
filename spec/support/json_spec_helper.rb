module Request
  module JsonHelpers
    def response_body
      @response_body ||= JSON.parse(response.body, symbolize_names: true)
    end
  end

  module HeadersHelpers
    def auth_header(token)
      request.headers['Authorization'] = token
    end
  end
end
