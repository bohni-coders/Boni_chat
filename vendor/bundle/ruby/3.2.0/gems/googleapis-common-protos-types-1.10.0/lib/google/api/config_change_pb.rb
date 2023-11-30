# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/api/config_change.proto

require 'google/protobuf'


descriptor_data = "\n\x1egoogle/api/config_change.proto\x12\ngoogle.api\"\x97\x01\n\x0c\x43onfigChange\x12\x0f\n\x07\x65lement\x18\x01 \x01(\t\x12\x11\n\told_value\x18\x02 \x01(\t\x12\x11\n\tnew_value\x18\x03 \x01(\t\x12+\n\x0b\x63hange_type\x18\x04 \x01(\x0e\x32\x16.google.api.ChangeType\x12#\n\x07\x61\x64vices\x18\x05 \x03(\x0b\x32\x12.google.api.Advice\"\x1d\n\x06\x41\x64vice\x12\x13\n\x0b\x64\x65scription\x18\x02 \x01(\t*O\n\nChangeType\x12\x1b\n\x17\x43HANGE_TYPE_UNSPECIFIED\x10\x00\x12\t\n\x05\x41\x44\x44\x45\x44\x10\x01\x12\x0b\n\x07REMOVED\x10\x02\x12\x0c\n\x08MODIFIED\x10\x03\x42q\n\x0e\x63om.google.apiB\x11\x43onfigChangeProtoP\x01ZCgoogle.golang.org/genproto/googleapis/api/configchange;configchange\xa2\x02\x04GAPIb\x06proto3"

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
    ConfigChange = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.ConfigChange").msgclass
    Advice = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.Advice").msgclass
    ChangeType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.ChangeType").enummodule
  end
end

#### Source proto file: google/api/config_change.proto ####
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
# option go_package = "google.golang.org/genproto/googleapis/api/configchange;configchange";
# option java_multiple_files = true;
# option java_outer_classname = "ConfigChangeProto";
# option java_package = "com.google.api";
# option objc_class_prefix = "GAPI";
#
# // Output generated from semantically comparing two versions of a service
# // configuration.
# //
# // Includes detailed information about a field that have changed with
# // applicable advice about potential consequences for the change, such as
# // backwards-incompatibility.
# message ConfigChange {
#   // Object hierarchy path to the change, with levels separated by a '.'
#   // character. For repeated fields, an applicable unique identifier field is
#   // used for the index (usually selector, name, or id). For maps, the term
#   // 'key' is used. If the field has no unique identifier, the numeric index
#   // is used.
#   // Examples:
#   // - visibility.rules[selector=="google.LibraryService.ListBooks"].restriction
#   // - quota.metric_rules[selector=="google"].metric_costs[key=="reads"].value
#   // - logging.producer_destinations[0]
#   string element = 1;
#
#   // Value of the changed object in the old Service configuration,
#   // in JSON format. This field will not be populated if ChangeType == ADDED.
#   string old_value = 2;
#
#   // Value of the changed object in the new Service configuration,
#   // in JSON format. This field will not be populated if ChangeType == REMOVED.
#   string new_value = 3;
#
#   // The type for this change, either ADDED, REMOVED, or MODIFIED.
#   ChangeType change_type = 4;
#
#   // Collection of advice provided for this change, useful for determining the
#   // possible impact of this change.
#   repeated Advice advices = 5;
# }
#
# // Generated advice about this change, used for providing more
# // information about how a change will affect the existing service.
# message Advice {
#   // Useful description for why this advice was applied and what actions should
#   // be taken to mitigate any implied risks.
#   string description = 2;
# }
#
# // Classifies set of possible modifications to an object in the service
# // configuration.
# enum ChangeType {
#   // No value was provided.
#   CHANGE_TYPE_UNSPECIFIED = 0;
#
#   // The changed object exists in the 'new' service configuration, but not
#   // in the 'old' service configuration.
#   ADDED = 1;
#
#   // The changed object exists in the 'old' service configuration, but not
#   // in the 'new' service configuration.
#   REMOVED = 2;
#
#   // The changed object exists in both service configurations, but its value
#   // is different.
#   MODIFIED = 3;
# }
