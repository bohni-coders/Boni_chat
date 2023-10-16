##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Lookups < Domain
      class V2 < Version
        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class PhoneNumberList < ListResource
          ##
          # Initialize the PhoneNumberList
          # @param [Version] version Version that contains the resource
          # @return [PhoneNumberList] PhoneNumberList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Lookups.V2.PhoneNumberList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class PhoneNumberPage < Page
          ##
          # Initialize the PhoneNumberPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [PhoneNumberPage] PhoneNumberPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of PhoneNumberInstance
          # @param [Hash] payload Payload response from the API
          # @return [PhoneNumberInstance] PhoneNumberInstance
          def get_instance(payload)
            PhoneNumberInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Lookups.V2.PhoneNumberPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class PhoneNumberContext < InstanceContext
          ##
          # Initialize the PhoneNumberContext
          # @param [Version] version Version that contains the resource
          # @param [String] phone_number The phone number to lookup in E.164 or national
          #   format. Default country code is +1 (North America).
          # @return [PhoneNumberContext] PhoneNumberContext
          def initialize(version, phone_number)
            super(version)

            # Path Solution
            @solution = {phone_number: phone_number, }
            @uri = "/PhoneNumbers/#{@solution[:phone_number]}"
          end

          ##
          # Fetch the PhoneNumberInstance
          # @param [String] fields A comma-separated list of fields to return. Possible
          #   values are caller_name, sim_swap, call_forwarding, live_activity,
          #   line_type_intelligence, identity_match.
          # @param [String] country_code The {country
          #   code}[https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2] used if the phone number
          #   provided is in national format.
          # @param [String] first_name User’s first name. This query parameter is only used
          #   (optionally) for identity_match package requests.
          # @param [String] last_name User’s last name. This query parameter is only used
          #   (optionally) for identity_match package requests.
          # @param [String] address_line_1 User’s first address line. This query parameter
          #   is only used (optionally) for identity_match package requests.
          # @param [String] address_line_2 User’s second address line. This query parameter
          #   is only used (optionally) for identity_match package requests.
          # @param [String] city User’s city. This query parameter is only used (optionally)
          #   for identity_match package requests.
          # @param [String] state User’s country subdivision, such as state, province, or
          #   locality. This query parameter is only used (optionally) for identity_match
          #   package requests.
          # @param [String] postal_code User’s postal zip code. This query parameter is only
          #   used (optionally) for identity_match package requests.
          # @param [String] address_country_code User’s country, up to two characters. This
          #   query parameter is only used (optionally) for identity_match package requests.
          # @param [String] national_id User’s national ID, such as SSN or Passport ID. This
          #   query parameter is only used (optionally) for identity_match package requests.
          # @param [String] date_of_birth User’s date of birth, in YYYYMMDD format. This
          #   query parameter is only used (optionally) for identity_match package requests.
          # @return [PhoneNumberInstance] Fetched PhoneNumberInstance
          def fetch(fields: :unset, country_code: :unset, first_name: :unset, last_name: :unset, address_line_1: :unset, address_line_2: :unset, city: :unset, state: :unset, postal_code: :unset, address_country_code: :unset, national_id: :unset, date_of_birth: :unset)
            params = Twilio::Values.of({
                'Fields' => fields,
                'CountryCode' => country_code,
                'FirstName' => first_name,
                'LastName' => last_name,
                'AddressLine1' => address_line_1,
                'AddressLine2' => address_line_2,
                'City' => city,
                'State' => state,
                'PostalCode' => postal_code,
                'AddressCountryCode' => address_country_code,
                'NationalId' => national_id,
                'DateOfBirth' => date_of_birth,
            })

            payload = @version.fetch('GET', @uri, params: params)

            PhoneNumberInstance.new(@version, payload, phone_number: @solution[:phone_number], )
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Lookups.V2.PhoneNumberContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Lookups.V2.PhoneNumberContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class PhoneNumberInstance < InstanceResource
          ##
          # Initialize the PhoneNumberInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] phone_number The phone number to lookup in E.164 or national
          #   format. Default country code is +1 (North America).
          # @return [PhoneNumberInstance] PhoneNumberInstance
          def initialize(version, payload, phone_number: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'calling_country_code' => payload['calling_country_code'],
                'country_code' => payload['country_code'],
                'phone_number' => payload['phone_number'],
                'national_format' => payload['national_format'],
                'valid' => payload['valid'],
                'validation_errors' => payload['validation_errors'],
                'caller_name' => payload['caller_name'],
                'sim_swap' => payload['sim_swap'],
                'call_forwarding' => payload['call_forwarding'],
                'live_activity' => payload['live_activity'],
                'line_type_intelligence' => payload['line_type_intelligence'],
                'identity_match' => payload['identity_match'],
                'sms_pumping_risk' => payload['sms_pumping_risk'],
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {'phone_number' => phone_number || @properties['phone_number'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [PhoneNumberContext] PhoneNumberContext for this PhoneNumberInstance
          def context
            unless @instance_context
              @instance_context = PhoneNumberContext.new(@version, @params['phone_number'], )
            end
            @instance_context
          end

          ##
          # @return [String] International dialing prefix
          def calling_country_code
            @properties['calling_country_code']
          end

          ##
          # @return [String] Phone number's ISO country code
          def country_code
            @properties['country_code']
          end

          ##
          # @return [String] Phone number in E.164 format
          def phone_number
            @properties['phone_number']
          end

          ##
          # @return [String] Phone number in national format
          def national_format
            @properties['national_format']
          end

          ##
          # @return [Boolean] Boolean which indicates if the phone number is valid
          def valid
            @properties['valid']
          end

          ##
          # @return [Array[phone_number.ValidationError]] Contains reasons why a phone number is invalid
          def validation_errors
            @properties['validation_errors']
          end

          ##
          # @return [Hash] An object that contains caller name information
          def caller_name
            @properties['caller_name']
          end

          ##
          # @return [Hash] An object that contains SIM swap information
          def sim_swap
            @properties['sim_swap']
          end

          ##
          # @return [Hash] An object that contains call forwarding status information
          def call_forwarding
            @properties['call_forwarding']
          end

          ##
          # @return [Hash] An object that contains live activity information
          def live_activity
            @properties['live_activity']
          end

          ##
          # @return [Hash] An object that contains line type information
          def line_type_intelligence
            @properties['line_type_intelligence']
          end

          ##
          # @return [Hash] An object that contains identity match information
          def identity_match
            @properties['identity_match']
          end

          ##
          # @return [Hash] An object that contains sms pumping risk information
          def sms_pumping_risk
            @properties['sms_pumping_risk']
          end

          ##
          # @return [String] The absolute URL of the resource
          def url
            @properties['url']
          end

          ##
          # Fetch the PhoneNumberInstance
          # @param [String] fields A comma-separated list of fields to return. Possible
          #   values are caller_name, sim_swap, call_forwarding, live_activity,
          #   line_type_intelligence, identity_match.
          # @param [String] country_code The {country
          #   code}[https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2] used if the phone number
          #   provided is in national format.
          # @param [String] first_name User’s first name. This query parameter is only used
          #   (optionally) for identity_match package requests.
          # @param [String] last_name User’s last name. This query parameter is only used
          #   (optionally) for identity_match package requests.
          # @param [String] address_line_1 User’s first address line. This query parameter
          #   is only used (optionally) for identity_match package requests.
          # @param [String] address_line_2 User’s second address line. This query parameter
          #   is only used (optionally) for identity_match package requests.
          # @param [String] city User’s city. This query parameter is only used (optionally)
          #   for identity_match package requests.
          # @param [String] state User’s country subdivision, such as state, province, or
          #   locality. This query parameter is only used (optionally) for identity_match
          #   package requests.
          # @param [String] postal_code User’s postal zip code. This query parameter is only
          #   used (optionally) for identity_match package requests.
          # @param [String] address_country_code User’s country, up to two characters. This
          #   query parameter is only used (optionally) for identity_match package requests.
          # @param [String] national_id User’s national ID, such as SSN or Passport ID. This
          #   query parameter is only used (optionally) for identity_match package requests.
          # @param [String] date_of_birth User’s date of birth, in YYYYMMDD format. This
          #   query parameter is only used (optionally) for identity_match package requests.
          # @return [PhoneNumberInstance] Fetched PhoneNumberInstance
          def fetch(fields: :unset, country_code: :unset, first_name: :unset, last_name: :unset, address_line_1: :unset, address_line_2: :unset, city: :unset, state: :unset, postal_code: :unset, address_country_code: :unset, national_id: :unset, date_of_birth: :unset)
            context.fetch(
                fields: fields,
                country_code: country_code,
                first_name: first_name,
                last_name: last_name,
                address_line_1: address_line_1,
                address_line_2: address_line_2,
                city: city,
                state: state,
                postal_code: postal_code,
                address_country_code: address_country_code,
                national_id: national_id,
                date_of_birth: date_of_birth,
            )
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Lookups.V2.PhoneNumberInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Lookups.V2.PhoneNumberInstance #{values}>"
          end
        end
      end
    end
  end
end