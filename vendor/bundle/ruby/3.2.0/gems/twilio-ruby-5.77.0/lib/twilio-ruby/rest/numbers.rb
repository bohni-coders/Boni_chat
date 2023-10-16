##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Numbers < Domain
      ##
      # Initialize the Numbers Domain
      def initialize(twilio)
        super

        @base_url = 'https://numbers.twilio.com'
        @host = 'numbers.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
        @v2 = nil
      end

      ##
      # Version v1 of numbers
      def v1
        @v1 ||= V1.new self
      end

      ##
      # Version v2 of numbers
      def v2
        @v2 ||= V2.new self
      end

      ##
      # @return [Twilio::REST::Numbers::V1::EligibilityInstance]
      def eligibilities
        self.v1.eligibilities()
      end

      ##
      # @return [Twilio::REST::Numbers::V2::RegulatoryComplianceInstance]
      def regulatory_compliance
        self.v2.regulatory_compliance()
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio::REST::Numbers>'
      end
    end
  end
end