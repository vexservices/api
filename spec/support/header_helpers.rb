module HeaderHelpers
  def request_header(version = 1, token = nil, device_token = nil, user_token = nil)
    options = {
      'Accept' => "application/vnd.coupon.v#{version}",
    }

    if token
      options.reverse_merge!(
        'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials(token)
      )
    end

    if device_token
      options.reverse_merge!(
        'X-Device-Token' => device_token
      )
    end

    if user_token
      options.reverse_merge!(
        'X-Access-Token' => user_token
      )
    end

    options
  end
end
