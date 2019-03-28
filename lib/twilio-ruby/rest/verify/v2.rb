##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Verify
      class V2 < Version
        ##
        # Initialize the V2 version of Verify
        def initialize(domain)
          super
          @version = 'v2'
          @services = nil
        end

        ##
        # @param [String] sid The unique SID identifier of Verification Service Instance.
        # @return [Twilio::REST::Verify::V2::ServiceContext] if sid was passed.
        # @return [Twilio::REST::Verify::V2::ServiceList]
        def services(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @services ||= ServiceList.new self
          else
            ServiceContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Verify::V2>'
        end
      end
    end
  end
end