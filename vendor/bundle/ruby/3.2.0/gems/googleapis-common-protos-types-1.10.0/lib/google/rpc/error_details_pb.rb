# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/rpc/error_details.proto

require 'google/protobuf'

require 'google/protobuf/duration_pb'


descriptor_data = "\n\x1egoogle/rpc/error_details.proto\x12\ngoogle.rpc\x1a\x1egoogle/protobuf/duration.proto\"\x93\x01\n\tErrorInfo\x12\x0e\n\x06reason\x18\x01 \x01(\t\x12\x0e\n\x06\x64omain\x18\x02 \x01(\t\x12\x35\n\x08metadata\x18\x03 \x03(\x0b\x32#.google.rpc.ErrorInfo.MetadataEntry\x1a/\n\rMetadataEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\";\n\tRetryInfo\x12.\n\x0bretry_delay\x18\x01 \x01(\x0b\x32\x19.google.protobuf.Duration\"2\n\tDebugInfo\x12\x15\n\rstack_entries\x18\x01 \x03(\t\x12\x0e\n\x06\x64\x65tail\x18\x02 \x01(\t\"y\n\x0cQuotaFailure\x12\x36\n\nviolations\x18\x01 \x03(\x0b\x32\".google.rpc.QuotaFailure.Violation\x1a\x31\n\tViolation\x12\x0f\n\x07subject\x18\x01 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x02 \x01(\t\"\x95\x01\n\x13PreconditionFailure\x12=\n\nviolations\x18\x01 \x03(\x0b\x32).google.rpc.PreconditionFailure.Violation\x1a?\n\tViolation\x12\x0c\n\x04type\x18\x01 \x01(\t\x12\x0f\n\x07subject\x18\x02 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x03 \x01(\t\"\x83\x01\n\nBadRequest\x12?\n\x10\x66ield_violations\x18\x01 \x03(\x0b\x32%.google.rpc.BadRequest.FieldViolation\x1a\x34\n\x0e\x46ieldViolation\x12\r\n\x05\x66ield\x18\x01 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x02 \x01(\t\"7\n\x0bRequestInfo\x12\x12\n\nrequest_id\x18\x01 \x01(\t\x12\x14\n\x0cserving_data\x18\x02 \x01(\t\"`\n\x0cResourceInfo\x12\x15\n\rresource_type\x18\x01 \x01(\t\x12\x15\n\rresource_name\x18\x02 \x01(\t\x12\r\n\x05owner\x18\x03 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x04 \x01(\t\"V\n\x04Help\x12$\n\x05links\x18\x01 \x03(\x0b\x32\x15.google.rpc.Help.Link\x1a(\n\x04Link\x12\x13\n\x0b\x64\x65scription\x18\x01 \x01(\t\x12\x0b\n\x03url\x18\x02 \x01(\t\"3\n\x10LocalizedMessage\x12\x0e\n\x06locale\x18\x01 \x01(\t\x12\x0f\n\x07message\x18\x02 \x01(\tBl\n\x0e\x63om.google.rpcB\x11\x45rrorDetailsProtoP\x01Z?google.golang.org/genproto/googleapis/rpc/errdetails;errdetails\xa2\x02\x03RPCb\x06proto3"

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
    ["google.protobuf.Duration", "google/protobuf/duration.proto"],
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
  module Rpc
    ErrorInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.rpc.ErrorInfo").msgclass
    RetryInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.rpc.RetryInfo").msgclass
    DebugInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.rpc.DebugInfo").msgclass
    QuotaFailure = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.rpc.QuotaFailure").msgclass
    QuotaFailure::Violation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.rpc.QuotaFailure.Violation").msgclass
    PreconditionFailure = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.rpc.PreconditionFailure").msgclass
    PreconditionFailure::Violation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.rpc.PreconditionFailure.Violation").msgclass
    BadRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.rpc.BadRequest").msgclass
    BadRequest::FieldViolation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.rpc.BadRequest.FieldViolation").msgclass
    RequestInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.rpc.RequestInfo").msgclass
    ResourceInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.rpc.ResourceInfo").msgclass
    Help = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.rpc.Help").msgclass
    Help::Link = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.rpc.Help.Link").msgclass
    LocalizedMessage = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.rpc.LocalizedMessage").msgclass
  end
end

#### Source proto file: google/rpc/error_details.proto ####
#
# // Copyright 2022 Google LLC
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
# package google.rpc;
#
# import "google/protobuf/duration.proto";
#
# option go_package = "google.golang.org/genproto/googleapis/rpc/errdetails;errdetails";
# option java_multiple_files = true;
# option java_outer_classname = "ErrorDetailsProto";
# option java_package = "com.google.rpc";
# option objc_class_prefix = "RPC";
#
# // Describes the cause of the error with structured details.
# //
# // Example of an error when contacting the "pubsub.googleapis.com" API when it
# // is not enabled:
# //
# //     { "reason": "API_DISABLED"
# //       "domain": "googleapis.com"
# //       "metadata": {
# //         "resource": "projects/123",
# //         "service": "pubsub.googleapis.com"
# //       }
# //     }
# //
# // This response indicates that the pubsub.googleapis.com API is not enabled.
# //
# // Example of an error that is returned when attempting to create a Spanner
# // instance in a region that is out of stock:
# //
# //     { "reason": "STOCKOUT"
# //       "domain": "spanner.googleapis.com",
# //       "metadata": {
# //         "availableRegions": "us-central1,us-east2"
# //       }
# //     }
# message ErrorInfo {
#   // The reason of the error. This is a constant value that identifies the
#   // proximate cause of the error. Error reasons are unique within a particular
#   // domain of errors. This should be at most 63 characters and match a
#   // regular expression of `[A-Z][A-Z0-9_]+[A-Z0-9]`, which represents
#   // UPPER_SNAKE_CASE.
#   string reason = 1;
#
#   // The logical grouping to which the "reason" belongs. The error domain
#   // is typically the registered service name of the tool or product that
#   // generates the error. Example: "pubsub.googleapis.com". If the error is
#   // generated by some common infrastructure, the error domain must be a
#   // globally unique value that identifies the infrastructure. For Google API
#   // infrastructure, the error domain is "googleapis.com".
#   string domain = 2;
#
#   // Additional structured details about this error.
#   //
#   // Keys should match /[a-zA-Z0-9-_]/ and be limited to 64 characters in
#   // length. When identifying the current value of an exceeded limit, the units
#   // should be contained in the key, not the value.  For example, rather than
#   // {"instanceLimit": "100/request"}, should be returned as,
#   // {"instanceLimitPerRequest": "100"}, if the client exceeds the number of
#   // instances that can be created in a single (batch) request.
#   map<string, string> metadata = 3;
# }
#
# // Describes when the clients can retry a failed request. Clients could ignore
# // the recommendation here or retry when this information is missing from error
# // responses.
# //
# // It's always recommended that clients should use exponential backoff when
# // retrying.
# //
# // Clients should wait until `retry_delay` amount of time has passed since
# // receiving the error response before retrying.  If retrying requests also
# // fail, clients should use an exponential backoff scheme to gradually increase
# // the delay between retries based on `retry_delay`, until either a maximum
# // number of retries have been reached or a maximum retry delay cap has been
# // reached.
# message RetryInfo {
#   // Clients should wait at least this long between retrying the same request.
#   google.protobuf.Duration retry_delay = 1;
# }
#
# // Describes additional debugging info.
# message DebugInfo {
#   // The stack trace entries indicating where the error occurred.
#   repeated string stack_entries = 1;
#
#   // Additional debugging information provided by the server.
#   string detail = 2;
# }
#
# // Describes how a quota check failed.
# //
# // For example if a daily limit was exceeded for the calling project,
# // a service could respond with a QuotaFailure detail containing the project
# // id and the description of the quota limit that was exceeded.  If the
# // calling project hasn't enabled the service in the developer console, then
# // a service could respond with the project id and set `service_disabled`
# // to true.
# //
# // Also see RetryInfo and Help types for other details about handling a
# // quota failure.
# message QuotaFailure {
#   // A message type used to describe a single quota violation.  For example, a
#   // daily quota or a custom quota that was exceeded.
#   message Violation {
#     // The subject on which the quota check failed.
#     // For example, "clientip:<ip address of client>" or "project:<Google
#     // developer project id>".
#     string subject = 1;
#
#     // A description of how the quota check failed. Clients can use this
#     // description to find more about the quota configuration in the service's
#     // public documentation, or find the relevant quota limit to adjust through
#     // developer console.
#     //
#     // For example: "Service disabled" or "Daily Limit for read operations
#     // exceeded".
#     string description = 2;
#   }
#
#   // Describes all quota violations.
#   repeated Violation violations = 1;
# }
#
# // Describes what preconditions have failed.
# //
# // For example, if an RPC failed because it required the Terms of Service to be
# // acknowledged, it could list the terms of service violation in the
# // PreconditionFailure message.
# message PreconditionFailure {
#   // A message type used to describe a single precondition failure.
#   message Violation {
#     // The type of PreconditionFailure. We recommend using a service-specific
#     // enum type to define the supported precondition violation subjects. For
#     // example, "TOS" for "Terms of Service violation".
#     string type = 1;
#
#     // The subject, relative to the type, that failed.
#     // For example, "google.com/cloud" relative to the "TOS" type would indicate
#     // which terms of service is being referenced.
#     string subject = 2;
#
#     // A description of how the precondition failed. Developers can use this
#     // description to understand how to fix the failure.
#     //
#     // For example: "Terms of service not accepted".
#     string description = 3;
#   }
#
#   // Describes all precondition violations.
#   repeated Violation violations = 1;
# }
#
# // Describes violations in a client request. This error type focuses on the
# // syntactic aspects of the request.
# message BadRequest {
#   // A message type used to describe a single bad request field.
#   message FieldViolation {
#     // A path that leads to a field in the request body. The value will be a
#     // sequence of dot-separated identifiers that identify a protocol buffer
#     // field.
#     //
#     // Consider the following:
#     //
#     //     message CreateContactRequest {
#     //       message EmailAddress {
#     //         enum Type {
#     //           TYPE_UNSPECIFIED = 0;
#     //           HOME = 1;
#     //           WORK = 2;
#     //         }
#     //
#     //         optional string email = 1;
#     //         repeated EmailType type = 2;
#     //       }
#     //
#     //       string full_name = 1;
#     //       repeated EmailAddress email_addresses = 2;
#     //     }
#     //
#     // In this example, in proto `field` could take one of the following values:
#     //
#     // * `full_name` for a violation in the `full_name` value
#     // * `email_addresses[1].email` for a violation in the `email` field of the
#     //   first `email_addresses` message
#     // * `email_addresses[3].type[2]` for a violation in the second `type`
#     //   value in the third `email_addresses` message.
#     //
#     // In JSON, the same values are represented as:
#     //
#     // * `fullName` for a violation in the `fullName` value
#     // * `emailAddresses[1].email` for a violation in the `email` field of the
#     //   first `emailAddresses` message
#     // * `emailAddresses[3].type[2]` for a violation in the second `type`
#     //   value in the third `emailAddresses` message.
#     string field = 1;
#
#     // A description of why the request element is bad.
#     string description = 2;
#   }
#
#   // Describes all violations in a client request.
#   repeated FieldViolation field_violations = 1;
# }
#
# // Contains metadata about the request that clients can attach when filing a bug
# // or providing other forms of feedback.
# message RequestInfo {
#   // An opaque string that should only be interpreted by the service generating
#   // it. For example, it can be used to identify requests in the service's logs.
#   string request_id = 1;
#
#   // Any data that was used to serve this request. For example, an encrypted
#   // stack trace that can be sent back to the service provider for debugging.
#   string serving_data = 2;
# }
#
# // Describes the resource that is being accessed.
# message ResourceInfo {
#   // A name for the type of resource being accessed, e.g. "sql table",
#   // "cloud storage bucket", "file", "Google calendar"; or the type URL
#   // of the resource: e.g. "type.googleapis.com/google.pubsub.v1.Topic".
#   string resource_type = 1;
#
#   // The name of the resource being accessed.  For example, a shared calendar
#   // name: "example.com_4fghdhgsrgh@group.calendar.google.com", if the current
#   // error is
#   // [google.rpc.Code.PERMISSION_DENIED][google.rpc.Code.PERMISSION_DENIED].
#   string resource_name = 2;
#
#   // The owner of the resource (optional).
#   // For example, "user:<owner email>" or "project:<Google developer project
#   // id>".
#   string owner = 3;
#
#   // Describes what error is encountered when accessing this resource.
#   // For example, updating a cloud project may require the `writer` permission
#   // on the developer console project.
#   string description = 4;
# }
#
# // Provides links to documentation or for performing an out of band action.
# //
# // For example, if a quota check failed with an error indicating the calling
# // project hasn't enabled the accessed service, this can contain a URL pointing
# // directly to the right place in the developer console to flip the bit.
# message Help {
#   // Describes a URL link.
#   message Link {
#     // Describes what the link offers.
#     string description = 1;
#
#     // The URL of the link.
#     string url = 2;
#   }
#
#   // URL(s) pointing to additional information on handling the current error.
#   repeated Link links = 1;
# }
#
# // Provides a localized error message that is safe to return to the user
# // which can be attached to an RPC error.
# message LocalizedMessage {
#   // The locale used following the specification defined at
#   // https://www.rfc-editor.org/rfc/bcp/bcp47.txt.
#   // Examples are: "en-US", "fr-CH", "es-MX"
#   string locale = 1;
#
#   // The localized error message in the above locale.
#   string message = 2;
# }