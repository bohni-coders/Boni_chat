require 'httparty'

class QrCodeController < ApplicationController
  include HTTParty
  include RequestExceptionHandler

  def get_hash_code
    url = ENV['SOCKET_URL']

    options = {
      timeout: 20,
      open_timeout: 20,
    }

    response = self.class.get(url, options)

    if response.success?
      render json: { data: response.body, code: response.code }
    else
      render json: { data: nil, code: response.code, error: response.message }
    end
  end
end
