##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Oauth < Domain
      class V1 < Version
        class DeviceCodeList < ListResource
          ##
          # Initialize the DeviceCodeList
          # @param [Version] version Version that contains the resource
          # @return [DeviceCodeList] DeviceCodeList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/device/code"
          end

          ##
          # Create the DeviceCodeInstance
          # @param [String] client_sid A 34 character string that uniquely identifies this
          #   OAuth App.
          # @param [Array[String]] scopes An Array of scopes for authorization request
          # @param [Array[String]] audiences An array of intended audiences for token
          #   requests
          # @return [DeviceCodeInstance] Created DeviceCodeInstance
          def create(client_sid: nil, scopes: nil, audiences: :unset)
            data = Twilio::Values.of({
                'ClientSid' => client_sid,
                'Scopes' => Twilio.serialize_list(scopes) { |e| e },
                'Audiences' => Twilio.serialize_list(audiences) { |e| e },
            })

            payload = @version.create('POST', @uri, data: data)

            DeviceCodeInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Oauth.V1.DeviceCodeList>'
          end
        end

        class DeviceCodePage < Page
          ##
          # Initialize the DeviceCodePage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [DeviceCodePage] DeviceCodePage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of DeviceCodeInstance
          # @param [Hash] payload Payload response from the API
          # @return [DeviceCodeInstance] DeviceCodeInstance
          def get_instance(payload)
            DeviceCodeInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Oauth.V1.DeviceCodePage>'
          end
        end

        class DeviceCodeInstance < InstanceResource
          ##
          # Initialize the DeviceCodeInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @return [DeviceCodeInstance] DeviceCodeInstance
          def initialize(version, payload)
            super(version)

            # Marshaled Properties
            @properties = {
                'device_code' => payload['device_code'],
                'user_code' => payload['user_code'],
                'verification_uri' => payload['verification_uri'],
                'verification_uri_complete' => payload['verification_uri_complete'],
                'expires_in' => payload['expires_in'] == nil ? payload['expires_in'] : payload['expires_in'].to_i,
                'interval' => payload['interval'] == nil ? payload['interval'] : payload['interval'].to_i,
            }
          end

          ##
          # @return [String] The device verification code
          def device_code
            @properties['device_code']
          end

          ##
          # @return [String] The verification code for the end user
          def user_code
            @properties['user_code']
          end

          ##
          # @return [String] The URI that the end user visits to verify request
          def verification_uri
            @properties['verification_uri']
          end

          ##
          # @return [String] he URI with user_code that the end-user alternatively visits to verify request
          def verification_uri_complete
            @properties['verification_uri_complete']
          end

          ##
          # @return [String] The expiration time of the device_code and user_code in seconds
          def expires_in
            @properties['expires_in']
          end

          ##
          # @return [String] The minimum amount of time in seconds that the client should wait between polling requests to the token endpoint
          def interval
            @properties['interval']
          end

          ##
          # Provide a user friendly representation
          def to_s
            "<Twilio.Oauth.V1.DeviceCodeInstance>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            "<Twilio.Oauth.V1.DeviceCodeInstance>"
          end
        end
      end
    end
  end
end