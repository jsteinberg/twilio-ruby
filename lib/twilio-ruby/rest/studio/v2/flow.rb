##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Studio
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Studio < StudioBase
            class V2 < Version
                class FlowList < ListResource
                    ##
                    # Initialize the FlowList
                    # @param [Version] version Version that contains the resource
                    # @return [FlowList] FlowList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Flows"
                        
                    end
                    ##
                    # Create the FlowInstance
                    # @param [String] friendly_name The string that you assigned to describe the Flow.
                    # @param [Status] status 
                    # @param [Object] definition JSON representation of flow definition.
                    # @param [String] commit_message Description of change made in the revision.
                    # @return [FlowInstance] Created FlowInstance
                    def create(
                        friendly_name: nil, 
                        status: nil, 
                        definition: nil, 
                        commit_message: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'Status' => status,
                            'Definition' => Twilio.serialize_object(definition),
                            'CommitMessage' => commit_message,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        FlowInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists FlowInstance records from the API as a list.
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
                        self.stream(
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields FlowInstance records from the API.
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
                    # Retrieve a single page of FlowInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of FlowInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        FlowPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of FlowInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of FlowInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    FlowPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Studio.V2.FlowList>'
                    end
                end


                class FlowContext < InstanceContext
                    ##
                    # Initialize the FlowContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID of the Flow resource to fetch.
                    # @return [FlowContext] FlowContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Flows/#{@solution[:sid]}"

                        # Dependents
                        @executions = nil
                        @test_users = nil
                        @revisions = nil
                    end
                    ##
                    # Delete the FlowInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the FlowInstance
                    # @return [FlowInstance] Fetched FlowInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        FlowInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the FlowInstance
                    # @param [Status] status 
                    # @param [String] friendly_name The string that you assigned to describe the Flow.
                    # @param [Object] definition JSON representation of flow definition.
                    # @param [String] commit_message Description of change made in the revision.
                    # @return [FlowInstance] Updated FlowInstance
                    def update(
                        status: nil, 
                        friendly_name: :unset, 
                        definition: :unset, 
                        commit_message: :unset
                    )

                        data = Twilio::Values.of({
                            'Status' => status,
                            'FriendlyName' => friendly_name,
                            'Definition' => Twilio.serialize_object(definition),
                            'CommitMessage' => commit_message,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        FlowInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the executions
                    # @return [ExecutionList]
                    # @return [ExecutionContext] if sid was passed.
                    def executions(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return ExecutionContext.new(@version, @solution[:sid],sid )
                        end

                        unless @executions
                            @executions = ExecutionList.new(
                                @version, flow_sid: @solution[:sid], )
                        end

                     @executions
                    end
                    ##
                    # Access the test_users
                    # @return [FlowTestUserList]
                    # @return [FlowTestUserContext]
                    def test_users
                        FlowTestUserContext.new(
                                @version,
                                @solution[:sid]
                                )
                    end
                    ##
                    # Access the revisions
                    # @return [FlowRevisionList]
                    # @return [FlowRevisionContext] if sid was passed.
                    def revisions(revision=:unset)

                        raise ArgumentError, 'revision cannot be nil' if revision.nil?

                        if revision != :unset
                            return FlowRevisionContext.new(@version, @solution[:sid],revision )
                        end

                        unless @revisions
                            @revisions = FlowRevisionList.new(
                                @version, sid: @solution[:sid], )
                        end

                     @revisions
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Studio.V2.FlowContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Studio.V2.FlowContext #{context}>"
                    end
                end

                class FlowPage < Page
                    ##
                    # Initialize the FlowPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [FlowPage] FlowPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of FlowInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [FlowInstance] FlowInstance
                    def get_instance(payload)
                        FlowInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Studio.V2.FlowPage>'
                    end
                end
                class FlowInstance < InstanceResource
                    ##
                    # Initialize the FlowInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Flow
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [FlowInstance] FlowInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'friendly_name' => payload['friendly_name'],
                            'definition' => payload['definition'],
                            'status' => payload['status'],
                            'revision' => payload['revision'] == nil ? payload['revision'] : payload['revision'].to_i,
                            'commit_message' => payload['commit_message'],
                            'valid' => payload['valid'],
                            'errors' => payload['errors'],
                            'warnings' => payload['warnings'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'webhook_url' => payload['webhook_url'],
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [FlowContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = FlowContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Flow resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flow resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the Flow.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [Hash] JSON representation of flow definition.
                    def definition
                        @properties['definition']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] The latest revision number of the Flow's definition.
                    def revision
                        @properties['revision']
                    end
                    
                    ##
                    # @return [String] Description of change made in the revision.
                    def commit_message
                        @properties['commit_message']
                    end
                    
                    ##
                    # @return [Boolean] Boolean if the flow definition is valid.
                    def valid
                        @properties['valid']
                    end
                    
                    ##
                    # @return [Array<Hash>] List of error in the flow definition.
                    def errors
                        @properties['errors']
                    end
                    
                    ##
                    # @return [Array<Hash>] List of warnings in the flow definition.
                    def warnings
                        @properties['warnings']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] 
                    def webhook_url
                        @properties['webhook_url']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] The URLs of the Flow's nested resources.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Delete the FlowInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the FlowInstance
                    # @return [FlowInstance] Fetched FlowInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the FlowInstance
                    # @param [Status] status 
                    # @param [String] friendly_name The string that you assigned to describe the Flow.
                    # @param [Object] definition JSON representation of flow definition.
                    # @param [String] commit_message Description of change made in the revision.
                    # @return [FlowInstance] Updated FlowInstance
                    def update(
                        status: nil, 
                        friendly_name: :unset, 
                        definition: :unset, 
                        commit_message: :unset
                    )

                        context.update(
                            status: status, 
                            friendly_name: friendly_name, 
                            definition: definition, 
                            commit_message: commit_message, 
                        )
                    end

                    ##
                    # Access the executions
                    # @return [executions] executions
                    def executions
                        context.executions
                    end

                    ##
                    # Access the test_users
                    # @return [test_users] test_users
                    def test_users
                        context.test_users
                    end

                    ##
                    # Access the revisions
                    # @return [revisions] revisions
                    def revisions
                        context.revisions
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Studio.V2.FlowInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Studio.V2.FlowInstance #{values}>"
                    end
                end

            end
        end
    end
end
