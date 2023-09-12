class QrCodeController < ActionController::Base
    include RequestExceptionHandler
    skip_before_action :verify_authenticity_token

    def get_hash_code
        url = URI.parse('http://65.0.73.210:3000/get-qrcode') || ENV['SOCKET_URL'] 

        http = Net::HTTP.new(url.host, url.port)

        # http.use_ssl = (url.scheme == 'https')

        request = Net::HTTP::Get.new(url)

        response = http.request(request)

        if response.code == '200'
        render json: { data: response.body, code: 200 }
        else
        render json: { data: null, code: 500 }
        end
    end
end