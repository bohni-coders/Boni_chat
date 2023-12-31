##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class FlexApi < Domain
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class InsightsSettingsAnswerSetsList < ListResource
          ##
          # Initialize the InsightsSettingsAnswerSetsList
          # @param [Version] version Version that contains the resource
          # @return [InsightsSettingsAnswerSetsList] InsightsSettingsAnswerSetsList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Insights/QM/Settings/AnswerSets"
          end

          ##
          # Fetch the InsightsSettingsAnswerSetsInstance
          # @param [String] token The Token HTTP request header
          # @return [InsightsSettingsAnswerSetsInstance] Fetched InsightsSettingsAnswerSetsInstance
          def fetch(token: :unset)
            headers = Twilio::Values.of({'Token' => token, })

            payload = @version.fetch('GET', @uri, headers: headers)

            InsightsSettingsAnswerSetsInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.FlexApi.V1.InsightsSettingsAnswerSetsList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class InsightsSettingsAnswerSetsPage < Page
          ##
          # Initialize the InsightsSettingsAnswerSetsPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [InsightsSettingsAnswerSetsPage] InsightsSettingsAnswerSetsPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of InsightsSettingsAnswerSetsInstance
          # @param [Hash] payload Payload response from the API
          # @return [InsightsSettingsAnswerSetsInstance] InsightsSettingsAnswerSetsInstance
          def get_instance(payload)
            InsightsSettingsAnswerSetsInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.FlexApi.V1.InsightsSettingsAnswerSetsPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class InsightsSettingsAnswerSetsInstance < InstanceResource
          ##
          # Initialize the InsightsSettingsAnswerSetsInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @return [InsightsSettingsAnswerSetsInstance] InsightsSettingsAnswerSetsInstance
          def initialize(version, payload)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'answer_sets' => payload['answer_sets'],
                'answer_set_categories' => payload['answer_set_categories'],
                'not_applicable' => payload['not_applicable'],
                'url' => payload['url'],
            }
          end

          ##
          # @return [String] The SID of the Account that created the resource and owns this Flex Insights
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [Hash] Answer Set list
          def answer_sets
            @properties['answer_sets']
          end

          ##
          # @return [Hash] Categories of Answer Set
          def answer_set_categories
            @properties['answer_set_categories']
          end

          ##
          # @return [Hash] NA answer set
          def not_applicable
            @properties['not_applicable']
          end

          ##
          # @return [String] The url
          def url
            @properties['url']
          end

          ##
          # Provide a user friendly representation
          def to_s
            "<Twilio.FlexApi.V1.InsightsSettingsAnswerSetsInstance>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            "<Twilio.FlexApi.V1.InsightsSettingsAnswerSetsInstance>"
          end
        end
      end
    end
  end
end