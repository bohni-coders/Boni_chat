# frozen_string_literal: true

# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "google/cloud/errors"
require "google/cloud/dialogflow/v2/version_pb"
require "google/cloud/dialogflow/v2/versions/rest/service_stub"
require "google/cloud/location/rest"

module Google
  module Cloud
    module Dialogflow
      module V2
        module Versions
          module Rest
            ##
            # REST client for the Versions service.
            #
            # Service for managing {::Google::Cloud::Dialogflow::V2::Version Versions}.
            #
            class Client
              include Paths

              # @private
              attr_reader :versions_stub

              ##
              # Configure the Versions Client class.
              #
              # See {::Google::Cloud::Dialogflow::V2::Versions::Rest::Client::Configuration}
              # for a description of the configuration fields.
              #
              # @example
              #
              #   # Modify the configuration for all Versions clients
              #   ::Google::Cloud::Dialogflow::V2::Versions::Rest::Client.configure do |config|
              #     config.timeout = 10.0
              #   end
              #
              # @yield [config] Configure the Client client.
              # @yieldparam config [Client::Configuration]
              #
              # @return [Client::Configuration]
              #
              def self.configure
                @configure ||= begin
                  namespace = ["Google", "Cloud", "Dialogflow", "V2"]
                  parent_config = while namespace.any?
                                    parent_name = namespace.join "::"
                                    parent_const = const_get parent_name
                                    break parent_const.configure if parent_const.respond_to? :configure
                                    namespace.pop
                                  end
                  default_config = Client::Configuration.new parent_config

                  default_config.timeout = 60.0
                  default_config.retry_policy = {
                    initial_delay: 0.1, max_delay: 60.0, multiplier: 1.3, retry_codes: [14]
                  }

                  default_config
                end
                yield @configure if block_given?
                @configure
              end

              ##
              # Configure the Versions Client instance.
              #
              # The configuration is set to the derived mode, meaning that values can be changed,
              # but structural changes (adding new fields, etc.) are not allowed. Structural changes
              # should be made on {Client.configure}.
              #
              # See {::Google::Cloud::Dialogflow::V2::Versions::Rest::Client::Configuration}
              # for a description of the configuration fields.
              #
              # @yield [config] Configure the Client client.
              # @yieldparam config [Client::Configuration]
              #
              # @return [Client::Configuration]
              #
              def configure
                yield @config if block_given?
                @config
              end

              ##
              # Create a new Versions REST client object.
              #
              # @example
              #
              #   # Create a client using the default configuration
              #   client = ::Google::Cloud::Dialogflow::V2::Versions::Rest::Client.new
              #
              #   # Create a client using a custom configuration
              #   client = ::Google::Cloud::Dialogflow::V2::Versions::Rest::Client.new do |config|
              #     config.timeout = 10.0
              #   end
              #
              # @yield [config] Configure the Versions client.
              # @yieldparam config [Client::Configuration]
              #
              def initialize
                # Create the configuration object
                @config = Configuration.new Client.configure

                # Yield the configuration if needed
                yield @config if block_given?

                # Create credentials
                credentials = @config.credentials
                # Use self-signed JWT if the endpoint is unchanged from default,
                # but only if the default endpoint does not have a region prefix.
                enable_self_signed_jwt = @config.endpoint == Configuration::DEFAULT_ENDPOINT &&
                                         !@config.endpoint.split(".").first.include?("-")
                credentials ||= Credentials.default scope: @config.scope,
                                                    enable_self_signed_jwt: enable_self_signed_jwt
                if credentials.is_a?(::String) || credentials.is_a?(::Hash)
                  credentials = Credentials.new credentials, scope: @config.scope
                end

                @quota_project_id = @config.quota_project
                @quota_project_id ||= credentials.quota_project_id if credentials.respond_to? :quota_project_id

                @location_client = Google::Cloud::Location::Locations::Rest::Client.new do |config|
                  config.credentials = credentials
                  config.quota_project = @quota_project_id
                  config.endpoint = @config.endpoint
                  config.bindings_override = @config.bindings_override
                end

                @versions_stub = ::Google::Cloud::Dialogflow::V2::Versions::Rest::ServiceStub.new endpoint: @config.endpoint, credentials: credentials
              end

              ##
              # Get the associated client for mix-in of the Locations.
              #
              # @return [Google::Cloud::Location::Locations::Rest::Client]
              #
              attr_reader :location_client

              # Service calls

              ##
              # Returns the list of all versions of the specified agent.
              #
              # @overload list_versions(request, options = nil)
              #   Pass arguments to `list_versions` via a request object, either of type
              #   {::Google::Cloud::Dialogflow::V2::ListVersionsRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Dialogflow::V2::ListVersionsRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
              #
              # @overload list_versions(parent: nil, page_size: nil, page_token: nil)
              #   Pass arguments to `list_versions` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param parent [::String]
              #     Required. The agent to list all versions from.
              #     Supported formats:
              #
              #     - `projects/<Project ID>/agent`
              #     - `projects/<Project ID>/locations/<Location ID>/agent`
              #   @param page_size [::Integer]
              #     Optional. The maximum number of items to return in a single page. By
              #     default 100 and at most 1000.
              #   @param page_token [::String]
              #     Optional. The next_page_token value returned from a previous list request.
              # @yield [result, operation] Access the result along with the TransportOperation object
              # @yieldparam result [::Gapic::Rest::PagedEnumerable<::Google::Cloud::Dialogflow::V2::Version>]
              # @yieldparam operation [::Gapic::Rest::TransportOperation]
              #
              # @return [::Gapic::Rest::PagedEnumerable<::Google::Cloud::Dialogflow::V2::Version>]
              #
              # @raise [::Google::Cloud::Error] if the REST call is aborted.
              #
              # @example Basic example
              #   require "google/cloud/dialogflow/v2"
              #
              #   # Create a client object. The client can be reused for multiple calls.
              #   client = Google::Cloud::Dialogflow::V2::Versions::Rest::Client.new
              #
              #   # Create a request. To set request fields, pass in keyword arguments.
              #   request = Google::Cloud::Dialogflow::V2::ListVersionsRequest.new
              #
              #   # Call the list_versions method.
              #   result = client.list_versions request
              #
              #   # The returned object is of type Gapic::PagedEnumerable. You can iterate
              #   # over elements, and API calls will be issued to fetch pages as needed.
              #   result.each do |item|
              #     # Each element is of type ::Google::Cloud::Dialogflow::V2::Version.
              #     p item
              #   end
              #
              def list_versions request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Dialogflow::V2::ListVersionsRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                call_metadata = @config.rpcs.list_versions.metadata.to_h

                # Set x-goog-api-client and x-goog-user-project headers
                call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Dialogflow::V2::VERSION,
                  transports_version_send: [:rest]

                call_metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                options.apply_defaults timeout:      @config.rpcs.list_versions.timeout,
                                       metadata:     call_metadata,
                                       retry_policy: @config.rpcs.list_versions.retry_policy

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @versions_stub.list_versions request, options do |result, operation|
                  result = ::Gapic::Rest::PagedEnumerable.new @versions_stub, :list_versions, "versions", request, result, options
                  yield result, operation if block_given?
                  return result
                end
              rescue ::Gapic::Rest::Error => e
                raise ::Google::Cloud::Error.from_error(e)
              end

              ##
              # Retrieves the specified agent version.
              #
              # @overload get_version(request, options = nil)
              #   Pass arguments to `get_version` via a request object, either of type
              #   {::Google::Cloud::Dialogflow::V2::GetVersionRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Dialogflow::V2::GetVersionRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
              #
              # @overload get_version(name: nil)
              #   Pass arguments to `get_version` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param name [::String]
              #     Required. The name of the version.
              #     Supported formats:
              #
              #     - `projects/<Project ID>/agent/versions/<Version ID>`
              #     - `projects/<Project ID>/locations/<Location ID>/agent/versions/<Version
              #       ID>`
              # @yield [result, operation] Access the result along with the TransportOperation object
              # @yieldparam result [::Google::Cloud::Dialogflow::V2::Version]
              # @yieldparam operation [::Gapic::Rest::TransportOperation]
              #
              # @return [::Google::Cloud::Dialogflow::V2::Version]
              #
              # @raise [::Google::Cloud::Error] if the REST call is aborted.
              #
              # @example Basic example
              #   require "google/cloud/dialogflow/v2"
              #
              #   # Create a client object. The client can be reused for multiple calls.
              #   client = Google::Cloud::Dialogflow::V2::Versions::Rest::Client.new
              #
              #   # Create a request. To set request fields, pass in keyword arguments.
              #   request = Google::Cloud::Dialogflow::V2::GetVersionRequest.new
              #
              #   # Call the get_version method.
              #   result = client.get_version request
              #
              #   # The returned object is of type Google::Cloud::Dialogflow::V2::Version.
              #   p result
              #
              def get_version request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Dialogflow::V2::GetVersionRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                call_metadata = @config.rpcs.get_version.metadata.to_h

                # Set x-goog-api-client and x-goog-user-project headers
                call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Dialogflow::V2::VERSION,
                  transports_version_send: [:rest]

                call_metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                options.apply_defaults timeout:      @config.rpcs.get_version.timeout,
                                       metadata:     call_metadata,
                                       retry_policy: @config.rpcs.get_version.retry_policy

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @versions_stub.get_version request, options do |result, operation|
                  yield result, operation if block_given?
                  return result
                end
              rescue ::Gapic::Rest::Error => e
                raise ::Google::Cloud::Error.from_error(e)
              end

              ##
              # Creates an agent version.
              #
              # The new version points to the agent instance in the "default" environment.
              #
              # @overload create_version(request, options = nil)
              #   Pass arguments to `create_version` via a request object, either of type
              #   {::Google::Cloud::Dialogflow::V2::CreateVersionRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Dialogflow::V2::CreateVersionRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
              #
              # @overload create_version(parent: nil, version: nil)
              #   Pass arguments to `create_version` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param parent [::String]
              #     Required. The agent to create a version for.
              #     Supported formats:
              #
              #     - `projects/<Project ID>/agent`
              #     - `projects/<Project ID>/locations/<Location ID>/agent`
              #   @param version [::Google::Cloud::Dialogflow::V2::Version, ::Hash]
              #     Required. The version to create.
              # @yield [result, operation] Access the result along with the TransportOperation object
              # @yieldparam result [::Google::Cloud::Dialogflow::V2::Version]
              # @yieldparam operation [::Gapic::Rest::TransportOperation]
              #
              # @return [::Google::Cloud::Dialogflow::V2::Version]
              #
              # @raise [::Google::Cloud::Error] if the REST call is aborted.
              #
              # @example Basic example
              #   require "google/cloud/dialogflow/v2"
              #
              #   # Create a client object. The client can be reused for multiple calls.
              #   client = Google::Cloud::Dialogflow::V2::Versions::Rest::Client.new
              #
              #   # Create a request. To set request fields, pass in keyword arguments.
              #   request = Google::Cloud::Dialogflow::V2::CreateVersionRequest.new
              #
              #   # Call the create_version method.
              #   result = client.create_version request
              #
              #   # The returned object is of type Google::Cloud::Dialogflow::V2::Version.
              #   p result
              #
              def create_version request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Dialogflow::V2::CreateVersionRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                call_metadata = @config.rpcs.create_version.metadata.to_h

                # Set x-goog-api-client and x-goog-user-project headers
                call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Dialogflow::V2::VERSION,
                  transports_version_send: [:rest]

                call_metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                options.apply_defaults timeout:      @config.rpcs.create_version.timeout,
                                       metadata:     call_metadata,
                                       retry_policy: @config.rpcs.create_version.retry_policy

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @versions_stub.create_version request, options do |result, operation|
                  yield result, operation if block_given?
                  return result
                end
              rescue ::Gapic::Rest::Error => e
                raise ::Google::Cloud::Error.from_error(e)
              end

              ##
              # Updates the specified agent version.
              #
              # Note that this method does not allow you to update the state of the agent
              # the given version points to. It allows you to update only mutable
              # properties of the version resource.
              #
              # @overload update_version(request, options = nil)
              #   Pass arguments to `update_version` via a request object, either of type
              #   {::Google::Cloud::Dialogflow::V2::UpdateVersionRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Dialogflow::V2::UpdateVersionRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
              #
              # @overload update_version(version: nil, update_mask: nil)
              #   Pass arguments to `update_version` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param version [::Google::Cloud::Dialogflow::V2::Version, ::Hash]
              #     Required. The version to update.
              #     Supported formats:
              #
              #     - `projects/<Project ID>/agent/versions/<Version ID>`
              #     - `projects/<Project ID>/locations/<Location ID>/agent/versions/<Version
              #       ID>`
              #   @param update_mask [::Google::Protobuf::FieldMask, ::Hash]
              #     Required. The mask to control which fields get updated.
              # @yield [result, operation] Access the result along with the TransportOperation object
              # @yieldparam result [::Google::Cloud::Dialogflow::V2::Version]
              # @yieldparam operation [::Gapic::Rest::TransportOperation]
              #
              # @return [::Google::Cloud::Dialogflow::V2::Version]
              #
              # @raise [::Google::Cloud::Error] if the REST call is aborted.
              #
              # @example Basic example
              #   require "google/cloud/dialogflow/v2"
              #
              #   # Create a client object. The client can be reused for multiple calls.
              #   client = Google::Cloud::Dialogflow::V2::Versions::Rest::Client.new
              #
              #   # Create a request. To set request fields, pass in keyword arguments.
              #   request = Google::Cloud::Dialogflow::V2::UpdateVersionRequest.new
              #
              #   # Call the update_version method.
              #   result = client.update_version request
              #
              #   # The returned object is of type Google::Cloud::Dialogflow::V2::Version.
              #   p result
              #
              def update_version request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Dialogflow::V2::UpdateVersionRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                call_metadata = @config.rpcs.update_version.metadata.to_h

                # Set x-goog-api-client and x-goog-user-project headers
                call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Dialogflow::V2::VERSION,
                  transports_version_send: [:rest]

                call_metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                options.apply_defaults timeout:      @config.rpcs.update_version.timeout,
                                       metadata:     call_metadata,
                                       retry_policy: @config.rpcs.update_version.retry_policy

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @versions_stub.update_version request, options do |result, operation|
                  yield result, operation if block_given?
                  return result
                end
              rescue ::Gapic::Rest::Error => e
                raise ::Google::Cloud::Error.from_error(e)
              end

              ##
              # Delete the specified agent version.
              #
              # @overload delete_version(request, options = nil)
              #   Pass arguments to `delete_version` via a request object, either of type
              #   {::Google::Cloud::Dialogflow::V2::DeleteVersionRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Dialogflow::V2::DeleteVersionRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
              #
              # @overload delete_version(name: nil)
              #   Pass arguments to `delete_version` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param name [::String]
              #     Required. The name of the version to delete.
              #     Supported formats:
              #
              #     - `projects/<Project ID>/agent/versions/<Version ID>`
              #     - `projects/<Project ID>/locations/<Location ID>/agent/versions/<Version
              #       ID>`
              # @yield [result, operation] Access the result along with the TransportOperation object
              # @yieldparam result [::Google::Protobuf::Empty]
              # @yieldparam operation [::Gapic::Rest::TransportOperation]
              #
              # @return [::Google::Protobuf::Empty]
              #
              # @raise [::Google::Cloud::Error] if the REST call is aborted.
              #
              # @example Basic example
              #   require "google/cloud/dialogflow/v2"
              #
              #   # Create a client object. The client can be reused for multiple calls.
              #   client = Google::Cloud::Dialogflow::V2::Versions::Rest::Client.new
              #
              #   # Create a request. To set request fields, pass in keyword arguments.
              #   request = Google::Cloud::Dialogflow::V2::DeleteVersionRequest.new
              #
              #   # Call the delete_version method.
              #   result = client.delete_version request
              #
              #   # The returned object is of type Google::Protobuf::Empty.
              #   p result
              #
              def delete_version request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Dialogflow::V2::DeleteVersionRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                call_metadata = @config.rpcs.delete_version.metadata.to_h

                # Set x-goog-api-client and x-goog-user-project headers
                call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Dialogflow::V2::VERSION,
                  transports_version_send: [:rest]

                call_metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                options.apply_defaults timeout:      @config.rpcs.delete_version.timeout,
                                       metadata:     call_metadata,
                                       retry_policy: @config.rpcs.delete_version.retry_policy

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @versions_stub.delete_version request, options do |result, operation|
                  yield result, operation if block_given?
                  return result
                end
              rescue ::Gapic::Rest::Error => e
                raise ::Google::Cloud::Error.from_error(e)
              end

              ##
              # Configuration class for the Versions REST API.
              #
              # This class represents the configuration for Versions REST,
              # providing control over timeouts, retry behavior, logging, transport
              # parameters, and other low-level controls. Certain parameters can also be
              # applied individually to specific RPCs. See
              # {::Google::Cloud::Dialogflow::V2::Versions::Rest::Client::Configuration::Rpcs}
              # for a list of RPCs that can be configured independently.
              #
              # Configuration can be applied globally to all clients, or to a single client
              # on construction.
              #
              # @example
              #
              #   # Modify the global config, setting the timeout for
              #   # list_versions to 20 seconds,
              #   # and all remaining timeouts to 10 seconds.
              #   ::Google::Cloud::Dialogflow::V2::Versions::Rest::Client.configure do |config|
              #     config.timeout = 10.0
              #     config.rpcs.list_versions.timeout = 20.0
              #   end
              #
              #   # Apply the above configuration only to a new client.
              #   client = ::Google::Cloud::Dialogflow::V2::Versions::Rest::Client.new do |config|
              #     config.timeout = 10.0
              #     config.rpcs.list_versions.timeout = 20.0
              #   end
              #
              # @!attribute [rw] endpoint
              #   The hostname or hostname:port of the service endpoint.
              #   Defaults to `"dialogflow.googleapis.com"`.
              #   @return [::String]
              # @!attribute [rw] credentials
              #   Credentials to send with calls. You may provide any of the following types:
              #    *  (`String`) The path to a service account key file in JSON format
              #    *  (`Hash`) A service account key as a Hash
              #    *  (`Google::Auth::Credentials`) A googleauth credentials object
              #       (see the [googleauth docs](https://rubydoc.info/gems/googleauth/Google/Auth/Credentials))
              #    *  (`Signet::OAuth2::Client`) A signet oauth2 client object
              #       (see the [signet docs](https://rubydoc.info/gems/signet/Signet/OAuth2/Client))
              #    *  (`nil`) indicating no credentials
              #   @return [::Object]
              # @!attribute [rw] scope
              #   The OAuth scopes
              #   @return [::Array<::String>]
              # @!attribute [rw] lib_name
              #   The library name as recorded in instrumentation and logging
              #   @return [::String]
              # @!attribute [rw] lib_version
              #   The library version as recorded in instrumentation and logging
              #   @return [::String]
              # @!attribute [rw] timeout
              #   The call timeout in seconds.
              #   @return [::Numeric]
              # @!attribute [rw] metadata
              #   Additional headers to be sent with the call.
              #   @return [::Hash{::Symbol=>::String}]
              # @!attribute [rw] retry_policy
              #   The retry policy. The value is a hash with the following keys:
              #    *  `:initial_delay` (*type:* `Numeric`) - The initial delay in seconds.
              #    *  `:max_delay` (*type:* `Numeric`) - The max delay in seconds.
              #    *  `:multiplier` (*type:* `Numeric`) - The incremental backoff multiplier.
              #    *  `:retry_codes` (*type:* `Array<String>`) - The error codes that should
              #       trigger a retry.
              #   @return [::Hash]
              # @!attribute [rw] quota_project
              #   A separate project against which to charge quota.
              #   @return [::String]
              #
              class Configuration
                extend ::Gapic::Config

                DEFAULT_ENDPOINT = "dialogflow.googleapis.com"

                config_attr :endpoint,      DEFAULT_ENDPOINT, ::String
                config_attr :credentials,   nil do |value|
                  allowed = [::String, ::Hash, ::Proc, ::Symbol, ::Google::Auth::Credentials, ::Signet::OAuth2::Client, nil]
                  allowed.any? { |klass| klass === value }
                end
                config_attr :scope,         nil, ::String, ::Array, nil
                config_attr :lib_name,      nil, ::String, nil
                config_attr :lib_version,   nil, ::String, nil
                config_attr :timeout,       nil, ::Numeric, nil
                config_attr :metadata,      nil, ::Hash, nil
                config_attr :retry_policy,  nil, ::Hash, ::Proc, nil
                config_attr :quota_project, nil, ::String, nil

                # @private
                # Overrides for http bindings for the RPCs of this service
                # are only used when this service is used as mixin, and only
                # by the host service.
                # @return [::Hash{::Symbol=>::Array<::Gapic::Rest::GrpcTranscoder::HttpBinding>}]
                config_attr :bindings_override, {}, ::Hash, nil

                # @private
                def initialize parent_config = nil
                  @parent_config = parent_config unless parent_config.nil?

                  yield self if block_given?
                end

                ##
                # Configurations for individual RPCs
                # @return [Rpcs]
                #
                def rpcs
                  @rpcs ||= begin
                    parent_rpcs = nil
                    parent_rpcs = @parent_config.rpcs if defined?(@parent_config) && @parent_config.respond_to?(:rpcs)
                    Rpcs.new parent_rpcs
                  end
                end

                ##
                # Configuration RPC class for the Versions API.
                #
                # Includes fields providing the configuration for each RPC in this service.
                # Each configuration object is of type `Gapic::Config::Method` and includes
                # the following configuration fields:
                #
                #  *  `timeout` (*type:* `Numeric`) - The call timeout in seconds
                #  *  `metadata` (*type:* `Hash{Symbol=>String}`) - Additional headers
                #  *  `retry_policy (*type:* `Hash`) - The retry policy. The policy fields
                #     include the following keys:
                #      *  `:initial_delay` (*type:* `Numeric`) - The initial delay in seconds.
                #      *  `:max_delay` (*type:* `Numeric`) - The max delay in seconds.
                #      *  `:multiplier` (*type:* `Numeric`) - The incremental backoff multiplier.
                #      *  `:retry_codes` (*type:* `Array<String>`) - The error codes that should
                #         trigger a retry.
                #
                class Rpcs
                  ##
                  # RPC-specific configuration for `list_versions`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :list_versions
                  ##
                  # RPC-specific configuration for `get_version`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :get_version
                  ##
                  # RPC-specific configuration for `create_version`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :create_version
                  ##
                  # RPC-specific configuration for `update_version`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :update_version
                  ##
                  # RPC-specific configuration for `delete_version`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :delete_version

                  # @private
                  def initialize parent_rpcs = nil
                    list_versions_config = parent_rpcs.list_versions if parent_rpcs.respond_to? :list_versions
                    @list_versions = ::Gapic::Config::Method.new list_versions_config
                    get_version_config = parent_rpcs.get_version if parent_rpcs.respond_to? :get_version
                    @get_version = ::Gapic::Config::Method.new get_version_config
                    create_version_config = parent_rpcs.create_version if parent_rpcs.respond_to? :create_version
                    @create_version = ::Gapic::Config::Method.new create_version_config
                    update_version_config = parent_rpcs.update_version if parent_rpcs.respond_to? :update_version
                    @update_version = ::Gapic::Config::Method.new update_version_config
                    delete_version_config = parent_rpcs.delete_version if parent_rpcs.respond_to? :delete_version
                    @delete_version = ::Gapic::Config::Method.new delete_version_config

                    yield self if block_given?
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end