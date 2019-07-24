##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Verify < Domain
      class V2 < Version
        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ServiceList < ListResource
          ##
          # Initialize the ServiceList
          # @param [Version] version Version that contains the resource
          # @return [ServiceList] ServiceList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Services"
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the verification service. It can be up to 64 characters long. **This value
          #   should not contain PII.**
          # @param [String] code_length The length of the verification code to generate.
          #   Must be an integer value between 4 and 10, inclusive.
          # @param [Boolean] lookup_enabled Whether to perform a lookup with each
          #   verification started and return info about the phone number.
          # @param [Boolean] skip_sms_to_landlines Whether to skip sending SMS verifications
          #   to landlines. Requires `lookup_enabled`.
          # @param [Boolean] dtmf_input_required Whether to ask the user to press a number
          #   before delivering the verify code in a phone call.
          # @param [String] tts_name The name of an alternative text-to-speech service to
          #   use in phone calls. Applies only to TTS languages.
          # @param [Boolean] psd2_enabled Whether to pass PSD2 transaction parameters when
          #   starting a verification.
          # @return [ServiceInstance] Newly created ServiceInstance
          def create(friendly_name: nil, code_length: :unset, lookup_enabled: :unset, skip_sms_to_landlines: :unset, dtmf_input_required: :unset, tts_name: :unset, psd2_enabled: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'CodeLength' => code_length,
                'LookupEnabled' => lookup_enabled,
                'SkipSmsToLandlines' => skip_sms_to_landlines,
                'DtmfInputRequired' => dtmf_input_required,
                'TtsName' => tts_name,
                'Psd2Enabled' => psd2_enabled,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            ServiceInstance.new(@version, payload, )
          end

          ##
          # Lists ServiceInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(limit: nil, page_size: nil)
            self.stream(limit: limit, page_size: page_size).entries
          end

          ##
          # Streams ServiceInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields ServiceInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          def each
            limits = @version.read_limits

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of ServiceInstance
          def page(page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            ServicePage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of ServiceInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            ServicePage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Verify.V2.ServiceList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ServicePage < Page
          ##
          # Initialize the ServicePage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [ServicePage] ServicePage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of ServiceInstance
          # @param [Hash] payload Payload response from the API
          # @return [ServiceInstance] ServiceInstance
          def get_instance(payload)
            ServiceInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Verify.V2.ServicePage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ServiceContext < InstanceContext
          ##
          # Initialize the ServiceContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The Twilio-provided string that uniquely identifies the
          #   Verification Service resource to fetch.
          # @return [ServiceContext] ServiceContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Services/#{@solution[:sid]}"

            # Dependents
            @verifications = nil
            @verification_checks = nil
            @rate_limits = nil
            @messaging_configurations = nil
          end

          ##
          # Fetch a ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            ServiceInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Deletes the ServiceInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Update the ServiceInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the verification service. It can be up to 64 characters long. **This value
          #   should not contain PII.**
          # @param [String] code_length The length of the verification code to generate.
          #   Must be an integer value between 4 and 10, inclusive.
          # @param [Boolean] lookup_enabled Whether to perform a lookup with each
          #   verification started and return info about the phone number.
          # @param [Boolean] skip_sms_to_landlines Whether to skip sending SMS verifications
          #   to landlines. Requires `lookup_enabled`.
          # @param [Boolean] dtmf_input_required Whether to ask the user to press a number
          #   before delivering the verify code in a phone call.
          # @param [String] tts_name The name of an alternative text-to-speech service to
          #   use in phone calls. Applies only to TTS languages.
          # @param [Boolean] psd2_enabled Whether to pass PSD2 transaction parameters when
          #   starting a verification.
          # @return [ServiceInstance] Updated ServiceInstance
          def update(friendly_name: :unset, code_length: :unset, lookup_enabled: :unset, skip_sms_to_landlines: :unset, dtmf_input_required: :unset, tts_name: :unset, psd2_enabled: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'CodeLength' => code_length,
                'LookupEnabled' => lookup_enabled,
                'SkipSmsToLandlines' => skip_sms_to_landlines,
                'DtmfInputRequired' => dtmf_input_required,
                'TtsName' => tts_name,
                'Psd2Enabled' => psd2_enabled,
            })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            ServiceInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Access the verifications
          # @return [VerificationList]
          # @return [VerificationContext] if sid was passed.
          def verifications(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return VerificationContext.new(@version, @solution[:sid], sid, )
            end

            unless @verifications
              @verifications = VerificationList.new(@version, service_sid: @solution[:sid], )
            end

            @verifications
          end

          ##
          # Access the verification_checks
          # @return [VerificationCheckList]
          # @return [VerificationCheckContext]
          def verification_checks
            unless @verification_checks
              @verification_checks = VerificationCheckList.new(@version, service_sid: @solution[:sid], )
            end

            @verification_checks
          end

          ##
          # Access the rate_limits
          # @return [RateLimitList]
          # @return [RateLimitContext] if sid was passed.
          def rate_limits(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return RateLimitContext.new(@version, @solution[:sid], sid, )
            end

            unless @rate_limits
              @rate_limits = RateLimitList.new(@version, service_sid: @solution[:sid], )
            end

            @rate_limits
          end

          ##
          # Access the messaging_configurations
          # @return [MessagingConfigurationList]
          # @return [MessagingConfigurationContext] if country was passed.
          def messaging_configurations(country=:unset)
            raise ArgumentError, 'country cannot be nil' if country.nil?

            if country != :unset
              return MessagingConfigurationContext.new(@version, @solution[:sid], country, )
            end

            unless @messaging_configurations
              @messaging_configurations = MessagingConfigurationList.new(@version, service_sid: @solution[:sid], )
            end

            @messaging_configurations
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Verify.V2.ServiceContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Verify.V2.ServiceContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ServiceInstance < InstanceResource
          ##
          # Initialize the ServiceInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The Twilio-provided string that uniquely identifies the
          #   Verification Service resource to fetch.
          # @return [ServiceInstance] ServiceInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'account_sid' => payload['account_sid'],
                'friendly_name' => payload['friendly_name'],
                'code_length' => payload['code_length'].to_i,
                'lookup_enabled' => payload['lookup_enabled'],
                'psd2_enabled' => payload['psd2_enabled'],
                'skip_sms_to_landlines' => payload['skip_sms_to_landlines'],
                'dtmf_input_required' => payload['dtmf_input_required'],
                'tts_name' => payload['tts_name'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [ServiceContext] ServiceContext for this ServiceInstance
          def context
            unless @instance_context
              @instance_context = ServiceContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The unique string that identifies the resource
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The SID of the Account that created the resource
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] The string that you assigned to describe the verification service
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [String] The length of the verification code
          def code_length
            @properties['code_length']
          end

          ##
          # @return [Boolean] Whether to perform a lookup with each verification
          def lookup_enabled
            @properties['lookup_enabled']
          end

          ##
          # @return [Boolean] Whether to pass PSD2 transaction parameters when starting a verification
          def psd2_enabled
            @properties['psd2_enabled']
          end

          ##
          # @return [Boolean] Whether to skip sending SMS verifications to landlines
          def skip_sms_to_landlines
            @properties['skip_sms_to_landlines']
          end

          ##
          # @return [Boolean] Whether to ask the user to press a number before delivering the verify code in a phone call
          def dtmf_input_required
            @properties['dtmf_input_required']
          end

          ##
          # @return [String] The name of an alternative text-to-speech service to use in phone calls
          def tts_name
            @properties['tts_name']
          end

          ##
          # @return [Time] The RFC 2822 date and time in GMT when the resource was created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The RFC 2822 date and time in GMT when the resource was last updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The absolute URL of the resource
          def url
            @properties['url']
          end

          ##
          # @return [String] The URLs of related resources
          def links
            @properties['links']
          end

          ##
          # Fetch a ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            context.fetch
          end

          ##
          # Deletes the ServiceInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Update the ServiceInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the verification service. It can be up to 64 characters long. **This value
          #   should not contain PII.**
          # @param [String] code_length The length of the verification code to generate.
          #   Must be an integer value between 4 and 10, inclusive.
          # @param [Boolean] lookup_enabled Whether to perform a lookup with each
          #   verification started and return info about the phone number.
          # @param [Boolean] skip_sms_to_landlines Whether to skip sending SMS verifications
          #   to landlines. Requires `lookup_enabled`.
          # @param [Boolean] dtmf_input_required Whether to ask the user to press a number
          #   before delivering the verify code in a phone call.
          # @param [String] tts_name The name of an alternative text-to-speech service to
          #   use in phone calls. Applies only to TTS languages.
          # @param [Boolean] psd2_enabled Whether to pass PSD2 transaction parameters when
          #   starting a verification.
          # @return [ServiceInstance] Updated ServiceInstance
          def update(friendly_name: :unset, code_length: :unset, lookup_enabled: :unset, skip_sms_to_landlines: :unset, dtmf_input_required: :unset, tts_name: :unset, psd2_enabled: :unset)
            context.update(
                friendly_name: friendly_name,
                code_length: code_length,
                lookup_enabled: lookup_enabled,
                skip_sms_to_landlines: skip_sms_to_landlines,
                dtmf_input_required: dtmf_input_required,
                tts_name: tts_name,
                psd2_enabled: psd2_enabled,
            )
          end

          ##
          # Access the verifications
          # @return [verifications] verifications
          def verifications
            context.verifications
          end

          ##
          # Access the verification_checks
          # @return [verification_checks] verification_checks
          def verification_checks
            context.verification_checks
          end

          ##
          # Access the rate_limits
          # @return [rate_limits] rate_limits
          def rate_limits
            context.rate_limits
          end

          ##
          # Access the messaging_configurations
          # @return [messaging_configurations] messaging_configurations
          def messaging_configurations
            context.messaging_configurations
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Verify.V2.ServiceInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Verify.V2.ServiceInstance #{values}>"
          end
        end
      end
    end
  end
end