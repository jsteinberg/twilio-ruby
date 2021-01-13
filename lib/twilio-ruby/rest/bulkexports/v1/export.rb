##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Bulkexports < Domain
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ExportList < ListResource
          ##
          # Initialize the ExportList
          # @param [Version] version Version that contains the resource
          # @return [ExportList] ExportList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}

            # Components
            @jobs = nil
          end

          ##
          # Access the jobs
          # @param [String] job_sid The unique string that that we created to identify the
          #   Bulk Export job
          # @return [JobList]
          # @return [JobContext] if job_sid was passed.
          def jobs(job_sid=:unset)
            raise ArgumentError, 'job_sid cannot be nil' if job_sid.nil?

            if job_sid != :unset
              return JobContext.new(@version, job_sid, )
            end

              @jobs ||= JobList.new(@version, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Bulkexports.V1.ExportList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ExportPage < Page
          ##
          # Initialize the ExportPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [ExportPage] ExportPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of ExportInstance
          # @param [Hash] payload Payload response from the API
          # @return [ExportInstance] ExportInstance
          def get_instance(payload)
            ExportInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Bulkexports.V1.ExportPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ExportContext < InstanceContext
          ##
          # Initialize the ExportContext
          # @param [Version] version Version that contains the resource
          # @param [String] resource_type The type of communication – Messages, Calls,
          #   Conferences, and Participants
          # @return [ExportContext] ExportContext
          def initialize(version, resource_type)
            super(version)

            # Path Solution
            @solution = {resource_type: resource_type, }
            @uri = "/Exports/#{@solution[:resource_type]}"

            # Dependents
            @days = nil
            @export_custom_jobs = nil
          end

          ##
          # Fetch the ExportInstance
          # @return [ExportInstance] Fetched ExportInstance
          def fetch
            payload = @version.fetch('GET', @uri)

            ExportInstance.new(@version, payload, resource_type: @solution[:resource_type], )
          end

          ##
          # Access the days
          # @return [DayList]
          # @return [DayContext] if day was passed.
          def days(day=:unset)
            raise ArgumentError, 'day cannot be nil' if day.nil?

            if day != :unset
              return DayContext.new(@version, @solution[:resource_type], day, )
            end

            unless @days
              @days = DayList.new(@version, resource_type: @solution[:resource_type], )
            end

            @days
          end

          ##
          # Access the export_custom_jobs
          # @return [ExportCustomJobList]
          # @return [ExportCustomJobContext]
          def export_custom_jobs
            unless @export_custom_jobs
              @export_custom_jobs = ExportCustomJobList.new(@version, resource_type: @solution[:resource_type], )
            end

            @export_custom_jobs
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Bulkexports.V1.ExportContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Bulkexports.V1.ExportContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ExportInstance < InstanceResource
          ##
          # Initialize the ExportInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] resource_type The type of communication – Messages, Calls,
          #   Conferences, and Participants
          # @return [ExportInstance] ExportInstance
          def initialize(version, payload, resource_type: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'resource_type' => payload['resource_type'],
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'resource_type' => resource_type || @properties['resource_type'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [ExportContext] ExportContext for this ExportInstance
          def context
            unless @instance_context
              @instance_context = ExportContext.new(@version, @params['resource_type'], )
            end
            @instance_context
          end

          ##
          # @return [String] The type of communication – Messages, Calls, Conferences, and Participants
          def resource_type
            @properties['resource_type']
          end

          ##
          # @return [String] The URL of this resource.
          def url
            @properties['url']
          end

          ##
          # @return [String] Nested resource URLs.
          def links
            @properties['links']
          end

          ##
          # Fetch the ExportInstance
          # @return [ExportInstance] Fetched ExportInstance
          def fetch
            context.fetch
          end

          ##
          # Access the days
          # @return [days] days
          def days
            context.days
          end

          ##
          # Access the export_custom_jobs
          # @return [export_custom_jobs] export_custom_jobs
          def export_custom_jobs
            context.export_custom_jobs
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Bulkexports.V1.ExportInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Bulkexports.V1.ExportInstance #{values}>"
          end
        end
      end
    end
  end
end