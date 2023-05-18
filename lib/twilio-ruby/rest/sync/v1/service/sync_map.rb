##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Sync
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Sync < SyncBase
            class V1 < Version
                class ServiceContext < InstanceContext

                     class SyncMapList < ListResource
                    ##
                    # Initialize the SyncMapList
                    # @param [Version] version Version that contains the resource
                    # @return [SyncMapList] SyncMapList
                    def initialize(version, service_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid }
                        @uri = "/Services/#{@solution[:service_sid]}/Maps"
                        
                    end
                    ##
                    # Create the SyncMapInstance
                    # @param [String] unique_name An application-defined string that uniquely identifies the resource. It can be used as an alternative to the `sid` in the URL path to address the resource.
                    # @param [String] ttl An alias for `collection_ttl`. If both parameters are provided, this value is ignored.
                    # @param [String] collection_ttl How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the Sync Map expires (time-to-live) and is deleted.
                    # @return [SyncMapInstance] Created SyncMapInstance
                    def create(
                        unique_name: :unset, 
                        ttl: :unset, 
                        collection_ttl: :unset
                    )

                        data = Twilio::Values.of({
                            'UniqueName' => unique_name,
                            'Ttl' => ttl,
                            'CollectionTtl' => collection_ttl,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        SyncMapInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                        )
                    end

                
                    ##
                    # Lists SyncMapInstance records from the API as a list.
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
                    # When passed a block, yields SyncMapInstance records from the API.
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
                    # Retrieve a single page of SyncMapInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of SyncMapInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        SyncMapPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of SyncMapInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of SyncMapInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    SyncMapPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Sync.V1.SyncMapList>'
                    end
                end


                class SyncMapContext < InstanceContext
                    ##
                    # Initialize the SyncMapContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid The SID of the [Sync Service](https://www.twilio.com/docs/sync/api/service) with the Sync Map resource to update.
                    # @param [String] sid The SID of the Sync Map resource to update. Can be the Sync Map's `sid` or its `unique_name`.
                    # @return [SyncMapContext] SyncMapContext
                    def initialize(version, service_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, sid: sid,  }
                        @uri = "/Services/#{@solution[:service_sid]}/Maps/#{@solution[:sid]}"

                        # Dependents
                        @sync_map_items = nil
                        @sync_map_permissions = nil
                    end
                    ##
                    # Delete the SyncMapInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the SyncMapInstance
                    # @return [SyncMapInstance] Fetched SyncMapInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        SyncMapInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the SyncMapInstance
                    # @param [String] ttl An alias for `collection_ttl`. If both parameters are provided, this value is ignored.
                    # @param [String] collection_ttl How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the Sync Map expires (time-to-live) and is deleted.
                    # @return [SyncMapInstance] Updated SyncMapInstance
                    def update(
                        ttl: :unset, 
                        collection_ttl: :unset
                    )

                        data = Twilio::Values.of({
                            'Ttl' => ttl,
                            'CollectionTtl' => collection_ttl,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        SyncMapInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the sync_map_items
                    # @return [SyncMapItemList]
                    # @return [SyncMapItemContext] if sid was passed.
                    def sync_map_items(key=:unset)

                        raise ArgumentError, 'key cannot be nil' if key.nil?

                        if key != :unset
                            return SyncMapItemContext.new(@version, @solution[:service_sid], @solution[:sid],key )
                        end

                        unless @sync_map_items
                            @sync_map_items = SyncMapItemList.new(
                                @version, service_sid: @solution[:service_sid],  map_sid: @solution[:sid], )
                        end

                     @sync_map_items
                    end
                    ##
                    # Access the sync_map_permissions
                    # @return [SyncMapPermissionList]
                    # @return [SyncMapPermissionContext] if sid was passed.
                    def sync_map_permissions(identity=:unset)

                        raise ArgumentError, 'identity cannot be nil' if identity.nil?

                        if identity != :unset
                            return SyncMapPermissionContext.new(@version, @solution[:service_sid], @solution[:sid],identity )
                        end

                        unless @sync_map_permissions
                            @sync_map_permissions = SyncMapPermissionList.new(
                                @version, service_sid: @solution[:service_sid],  map_sid: @solution[:sid], )
                        end

                     @sync_map_permissions
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Sync.V1.SyncMapContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Sync.V1.SyncMapContext #{context}>"
                    end
                end

                class SyncMapPage < Page
                    ##
                    # Initialize the SyncMapPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SyncMapPage] SyncMapPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SyncMapInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SyncMapInstance] SyncMapInstance
                    def get_instance(payload)
                        SyncMapInstance.new(@version, payload, service_sid: @solution[:service_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Sync.V1.SyncMapPage>'
                    end
                end
                class SyncMapInstance < InstanceResource
                    ##
                    # Initialize the SyncMapInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this SyncMap
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SyncMapInstance] SyncMapInstance
                    def initialize(version, payload , service_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'unique_name' => payload['unique_name'],
                            'account_sid' => payload['account_sid'],
                            'service_sid' => payload['service_sid'],
                            'url' => payload['url'],
                            'links' => payload['links'],
                            'revision' => payload['revision'],
                            'date_expires' => Twilio.deserialize_iso8601_datetime(payload['date_expires']),
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'created_by' => payload['created_by'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'service_sid' => service_sid  || @properties['service_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [SyncMapContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = SyncMapContext.new(@version , @params['service_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Sync Map resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.
                    def unique_name
                        @properties['unique_name']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Sync Map resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Sync Service](https://www.twilio.com/docs/sync/api/service) the resource is associated with.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Sync Map resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] The URLs of the Sync Map's nested resources.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # @return [String] The current revision of the Sync Map, represented as a string.
                    def revision
                        @properties['revision']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Sync Map expires and will be deleted, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. If the Sync Map does not expire, this value is `null`. The Sync Map might not be deleted immediately after it expires.
                    def date_expires
                        @properties['date_expires']
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
                    # @return [String] The identity of the Sync Map's creator. If the Sync Map is created from the client SDK, the value matches the Access Token's `identity` field. If the Sync Map was created from the REST API, the value is `system`.
                    def created_by
                        @properties['created_by']
                    end
                    
                    ##
                    # Delete the SyncMapInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the SyncMapInstance
                    # @return [SyncMapInstance] Fetched SyncMapInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the SyncMapInstance
                    # @param [String] ttl An alias for `collection_ttl`. If both parameters are provided, this value is ignored.
                    # @param [String] collection_ttl How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the Sync Map expires (time-to-live) and is deleted.
                    # @return [SyncMapInstance] Updated SyncMapInstance
                    def update(
                        ttl: :unset, 
                        collection_ttl: :unset
                    )

                        context.update(
                            ttl: ttl, 
                            collection_ttl: collection_ttl, 
                        )
                    end

                    ##
                    # Access the sync_map_items
                    # @return [sync_map_items] sync_map_items
                    def sync_map_items
                        context.sync_map_items
                    end

                    ##
                    # Access the sync_map_permissions
                    # @return [sync_map_permissions] sync_map_permissions
                    def sync_map_permissions
                        context.sync_map_permissions
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Sync.V1.SyncMapInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Sync.V1.SyncMapInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


