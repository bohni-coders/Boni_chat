# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/api/auth.proto

require 'google/protobuf'


descriptor_data = "\n\x15google/api/auth.proto\x12\ngoogle.api\"l\n\x0e\x41uthentication\x12-\n\x05rules\x18\x03 \x03(\x0b\x32\x1e.google.api.AuthenticationRule\x12+\n\tproviders\x18\x04 \x03(\x0b\x32\x18.google.api.AuthProvider\"\xa9\x01\n\x12\x41uthenticationRule\x12\x10\n\x08selector\x18\x01 \x01(\t\x12,\n\x05oauth\x18\x02 \x01(\x0b\x32\x1d.google.api.OAuthRequirements\x12 \n\x18\x61llow_without_credential\x18\x05 \x01(\x08\x12\x31\n\x0crequirements\x18\x07 \x03(\x0b\x32\x1b.google.api.AuthRequirement\"^\n\x0bJwtLocation\x12\x10\n\x06header\x18\x01 \x01(\tH\x00\x12\x0f\n\x05query\x18\x02 \x01(\tH\x00\x12\x10\n\x06\x63ookie\x18\x04 \x01(\tH\x00\x12\x14\n\x0cvalue_prefix\x18\x03 \x01(\tB\x04\n\x02in\"\x9a\x01\n\x0c\x41uthProvider\x12\n\n\x02id\x18\x01 \x01(\t\x12\x0e\n\x06issuer\x18\x02 \x01(\t\x12\x10\n\x08jwks_uri\x18\x03 \x01(\t\x12\x11\n\taudiences\x18\x04 \x01(\t\x12\x19\n\x11\x61uthorization_url\x18\x05 \x01(\t\x12.\n\rjwt_locations\x18\x06 \x03(\x0b\x32\x17.google.api.JwtLocation\"-\n\x11OAuthRequirements\x12\x18\n\x10\x63\x61nonical_scopes\x18\x01 \x01(\t\"9\n\x0f\x41uthRequirement\x12\x13\n\x0bprovider_id\x18\x01 \x01(\t\x12\x11\n\taudiences\x18\x02 \x01(\tBk\n\x0e\x63om.google.apiB\tAuthProtoP\x01ZEgoogle.golang.org/genproto/googleapis/api/serviceconfig;serviceconfig\xa2\x02\x04GAPIb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError => e
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
  ]
  imports.each do |type_name, expected_filename|
    import_file = pool.lookup(type_name).file_descriptor
    if import_file.name != expected_filename
      warn "- #{file.name} imports #{expected_filename}, but that import was loaded as #{import_file.name}"
    end
  end
  warn "Each proto file must use a consistent fully-qualified name."
  warn "This will become an error in the next major version."
end

module Google
  module Api
    Authentication = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.Authentication").msgclass
    AuthenticationRule = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.AuthenticationRule").msgclass
    JwtLocation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.JwtLocation").msgclass
    AuthProvider = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.AuthProvider").msgclass
    OAuthRequirements = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.OAuthRequirements").msgclass
    AuthRequirement = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.AuthRequirement").msgclass
  end
end

#### Source proto file: google/api/auth.proto ####
#
# // Copyright 2023 Google LLC
# //
# // Licensed under the Apache License, Version 2.0 (the "License");
# // you may not use this file except in compliance with the License.
# // You may obtain a copy of the License at
# //
# //     http://www.apache.org/licenses/LICENSE-2.0
# //
# // Unless required by applicable law or agreed to in writing, software
# // distributed under the License is distributed on an "AS IS" BASIS,
# // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# // See the License for the specific language governing permissions and
# // limitations under the License.
#
# syntax = "proto3";
#
# package google.api;
#
# option go_package = "google.golang.org/genproto/googleapis/api/serviceconfig;serviceconfig";
# option java_multiple_files = true;
# option java_outer_classname = "AuthProto";
# option java_package = "com.google.api";
# option objc_class_prefix = "GAPI";
#
# // `Authentication` defines the authentication configuration for API methods
# // provided by an API service.
# //
# // Example:
# //
# //     name: calendar.googleapis.com
# //     authentication:
# //       providers:
# //       - id: google_calendar_auth
# //         jwks_uri: https://www.googleapis.com/oauth2/v1/certs
# //         issuer: https://securetoken.google.com
# //       rules:
# //       - selector: "*"
# //         requirements:
# //           provider_id: google_calendar_auth
# //       - selector: google.calendar.Delegate
# //         oauth:
# //           canonical_scopes: https://www.googleapis.com/auth/calendar.read
# message Authentication {
#   // A list of authentication rules that apply to individual API methods.
#   //
#   // **NOTE:** All service configuration rules follow "last one wins" order.
#   repeated AuthenticationRule rules = 3;
#
#   // Defines a set of authentication providers that a service supports.
#   repeated AuthProvider providers = 4;
# }
#
# // Authentication rules for the service.
# //
# // By default, if a method has any authentication requirements, every request
# // must include a valid credential matching one of the requirements.
# // It's an error to include more than one kind of credential in a single
# // request.
# //
# // If a method doesn't have any auth requirements, request credentials will be
# // ignored.
# message AuthenticationRule {
#   // Selects the methods to which this rule applies.
#   //
#   // Refer to [selector][google.api.DocumentationRule.selector] for syntax
#   // details.
#   string selector = 1;
#
#   // The requirements for OAuth credentials.
#   OAuthRequirements oauth = 2;
#
#   // If true, the service accepts API keys without any other credential.
#   // This flag only applies to HTTP and gRPC requests.
#   bool allow_without_credential = 5;
#
#   // Requirements for additional authentication providers.
#   repeated AuthRequirement requirements = 7;
# }
#
# // Specifies a location to extract JWT from an API request.
# message JwtLocation {
#   oneof in {
#     // Specifies HTTP header name to extract JWT token.
#     string header = 1;
#
#     // Specifies URL query parameter name to extract JWT token.
#     string query = 2;
#
#     // Specifies cookie name to extract JWT token.
#     string cookie = 4;
#   }
#
#   // The value prefix. The value format is "value_prefix{token}"
#   // Only applies to "in" header type. Must be empty for "in" query type.
#   // If not empty, the header value has to match (case sensitive) this prefix.
#   // If not matched, JWT will not be extracted. If matched, JWT will be
#   // extracted after the prefix is removed.
#   //
#   // For example, for "Authorization: Bearer {JWT}",
#   // value_prefix="Bearer " with a space at the end.
#   string value_prefix = 3;
# }
#
# // Configuration for an authentication provider, including support for
# // [JSON Web Token
# // (JWT)](https://tools.ietf.org/html/draft-ietf-oauth-json-web-token-32).
# message AuthProvider {
#   // The unique identifier of the auth provider. It will be referred to by
#   // `AuthRequirement.provider_id`.
#   //
#   // Example: "bookstore_auth".
#   string id = 1;
#
#   // Identifies the principal that issued the JWT. See
#   // https://tools.ietf.org/html/draft-ietf-oauth-json-web-token-32#section-4.1.1
#   // Usually a URL or an email address.
#   //
#   // Example: https://securetoken.google.com
#   // Example: 1234567-compute@developer.gserviceaccount.com
#   string issuer = 2;
#
#   // URL of the provider's public key set to validate signature of the JWT. See
#   // [OpenID
#   // Discovery](https://openid.net/specs/openid-connect-discovery-1_0.html#ProviderMetadata).
#   // Optional if the key set document:
#   //  - can be retrieved from
#   //    [OpenID
#   //    Discovery](https://openid.net/specs/openid-connect-discovery-1_0.html)
#   //    of the issuer.
#   //  - can be inferred from the email domain of the issuer (e.g. a Google
#   //  service account).
#   //
#   // Example: https://www.googleapis.com/oauth2/v1/certs
#   string jwks_uri = 3;
#
#   // The list of JWT
#   // [audiences](https://tools.ietf.org/html/draft-ietf-oauth-json-web-token-32#section-4.1.3).
#   // that are allowed to access. A JWT containing any of these audiences will
#   // be accepted. When this setting is absent, JWTs with audiences:
#   //   - "https://[service.name]/[google.protobuf.Api.name]"
#   //   - "https://[service.name]/"
#   // will be accepted.
#   // For example, if no audiences are in the setting, LibraryService API will
#   // accept JWTs with the following audiences:
#   //   -
#   //   https://library-example.googleapis.com/google.example.library.v1.LibraryService
#   //   - https://library-example.googleapis.com/
#   //
#   // Example:
#   //
#   //     audiences: bookstore_android.apps.googleusercontent.com,
#   //                bookstore_web.apps.googleusercontent.com
#   string audiences = 4;
#
#   // Redirect URL if JWT token is required but not present or is expired.
#   // Implement authorizationUrl of securityDefinitions in OpenAPI spec.
#   string authorization_url = 5;
#
#   // Defines the locations to extract the JWT.  For now it is only used by the
#   // Cloud Endpoints to store the OpenAPI extension [x-google-jwt-locations]
#   // (https://cloud.google.com/endpoints/docs/openapi/openapi-extensions#x-google-jwt-locations)
#   //
#   // JWT locations can be one of HTTP headers, URL query parameters or
#   // cookies. The rule is that the first match wins.
#   //
#   // If not specified,  default to use following 3 locations:
#   //    1) Authorization: Bearer
#   //    2) x-goog-iap-jwt-assertion
#   //    3) access_token query parameter
#   //
#   // Default locations can be specified as followings:
#   //    jwt_locations:
#   //    - header: Authorization
#   //      value_prefix: "Bearer "
#   //    - header: x-goog-iap-jwt-assertion
#   //    - query: access_token
#   repeated JwtLocation jwt_locations = 6;
# }
#
# // OAuth scopes are a way to define data and permissions on data. For example,
# // there are scopes defined for "Read-only access to Google Calendar" and
# // "Access to Cloud Platform". Users can consent to a scope for an application,
# // giving it permission to access that data on their behalf.
# //
# // OAuth scope specifications should be fairly coarse grained; a user will need
# // to see and understand the text description of what your scope means.
# //
# // In most cases: use one or at most two OAuth scopes for an entire family of
# // products. If your product has multiple APIs, you should probably be sharing
# // the OAuth scope across all of those APIs.
# //
# // When you need finer grained OAuth consent screens: talk with your product
# // management about how developers will use them in practice.
# //
# // Please note that even though each of the canonical scopes is enough for a
# // request to be accepted and passed to the backend, a request can still fail
# // due to the backend requiring additional scopes or permissions.
# message OAuthRequirements {
#   // The list of publicly documented OAuth scopes that are allowed access. An
#   // OAuth token containing any of these scopes will be accepted.
#   //
#   // Example:
#   //
#   //      canonical_scopes: https://www.googleapis.com/auth/calendar,
#   //                        https://www.googleapis.com/auth/calendar.read
#   string canonical_scopes = 1;
# }
#
# // User-defined authentication requirements, including support for
# // [JSON Web Token
# // (JWT)](https://tools.ietf.org/html/draft-ietf-oauth-json-web-token-32).
# message AuthRequirement {
#   // [id][google.api.AuthProvider.id] from authentication provider.
#   //
#   // Example:
#   //
#   //     provider_id: bookstore_auth
#   string provider_id = 1;
#
#   // NOTE: This will be deprecated soon, once AuthProvider.audiences is
#   // implemented and accepted in all the runtime components.
#   //
#   // The list of JWT
#   // [audiences](https://tools.ietf.org/html/draft-ietf-oauth-json-web-token-32#section-4.1.3).
#   // that are allowed to access. A JWT containing any of these audiences will
#   // be accepted. When this setting is absent, only JWTs with audience
#   // "https://[Service_name][google.api.Service.name]/[API_name][google.protobuf.Api.name]"
#   // will be accepted. For example, if no audiences are in the setting,
#   // LibraryService API will only accept JWTs with the following audience
#   // "https://library-example.googleapis.com/google.example.library.v1.LibraryService".
#   //
#   // Example:
#   //
#   //     audiences: bookstore_android.apps.googleusercontent.com,
#   //                bookstore_web.apps.googleusercontent.com
#   string audiences = 2;
# }