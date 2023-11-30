# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/dialogflow/v2/version.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/empty_pb'
require 'google/protobuf/field_mask_pb'
require 'google/protobuf/timestamp_pb'


descriptor_data = "\n(google/cloud/dialogflow/v2/version.proto\x12\x1agoogle.cloud.dialogflow.v2\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a\x1bgoogle/protobuf/empty.proto\x1a google/protobuf/field_mask.proto\x1a\x1fgoogle/protobuf/timestamp.proto\"\xc3\x03\n\x07Version\x12\x11\n\x04name\x18\x01 \x01(\tB\x03\xe0\x41\x03\x12\x18\n\x0b\x64\x65scription\x18\x02 \x01(\tB\x03\xe0\x41\x01\x12\x1b\n\x0eversion_number\x18\x03 \x01(\x05\x42\x03\xe0\x41\x03\x12\x34\n\x0b\x63reate_time\x18\x04 \x01(\x0b\x32\x1a.google.protobuf.TimestampB\x03\xe0\x41\x03\x12\x46\n\x06status\x18\x06 \x01(\x0e\x32\x31.google.cloud.dialogflow.v2.Version.VersionStatusB\x03\xe0\x41\x03\"W\n\rVersionStatus\x12\x1e\n\x1aVERSION_STATUS_UNSPECIFIED\x10\x00\x12\x0f\n\x0bIN_PROGRESS\x10\x01\x12\t\n\x05READY\x10\x02\x12\n\n\x06\x46\x41ILED\x10\x03:\x96\x01\xea\x41\x92\x01\n!dialogflow.googleapis.com/Version\x12+projects/{project}/agent/versions/{version}\x12@projects/{project}/locations/{location}/agent/versions/{version}\"\x81\x01\n\x13ListVersionsRequest\x12\x39\n\x06parent\x18\x01 \x01(\tB)\xe0\x41\x02\xfa\x41#\x12!dialogflow.googleapis.com/Version\x12\x16\n\tpage_size\x18\x02 \x01(\x05\x42\x03\xe0\x41\x01\x12\x17\n\npage_token\x18\x03 \x01(\tB\x03\xe0\x41\x01\"f\n\x14ListVersionsResponse\x12\x35\n\x08versions\x18\x01 \x03(\x0b\x32#.google.cloud.dialogflow.v2.Version\x12\x17\n\x0fnext_page_token\x18\x02 \x01(\t\"L\n\x11GetVersionRequest\x12\x37\n\x04name\x18\x01 \x01(\tB)\xe0\x41\x02\xfa\x41#\n!dialogflow.googleapis.com/Version\"\x8c\x01\n\x14\x43reateVersionRequest\x12\x39\n\x06parent\x18\x01 \x01(\tB)\xe0\x41\x02\xfa\x41#\x12!dialogflow.googleapis.com/Version\x12\x39\n\x07version\x18\x02 \x01(\x0b\x32#.google.cloud.dialogflow.v2.VersionB\x03\xe0\x41\x02\"\x87\x01\n\x14UpdateVersionRequest\x12\x39\n\x07version\x18\x01 \x01(\x0b\x32#.google.cloud.dialogflow.v2.VersionB\x03\xe0\x41\x02\x12\x34\n\x0bupdate_mask\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.FieldMaskB\x03\xe0\x41\x02\"O\n\x14\x44\x65leteVersionRequest\x12\x37\n\x04name\x18\x01 \x01(\tB)\xe0\x41\x02\xfa\x41#\n!dialogflow.googleapis.com/Version2\xfc\t\n\x08Versions\x12\xe0\x01\n\x0cListVersions\x12/.google.cloud.dialogflow.v2.ListVersionsRequest\x1a\x30.google.cloud.dialogflow.v2.ListVersionsResponse\"m\x82\xd3\xe4\x93\x02^\x12&/v2/{parent=projects/*/agent}/versionsZ4\x12\x32/v2/{parent=projects/*/locations/*/agent}/versions\xda\x41\x06parent\x12\xcd\x01\n\nGetVersion\x12-.google.cloud.dialogflow.v2.GetVersionRequest\x1a#.google.cloud.dialogflow.v2.Version\"k\x82\xd3\xe4\x93\x02^\x12&/v2/{name=projects/*/agent/versions/*}Z4\x12\x32/v2/{name=projects/*/locations/*/agent/versions/*}\xda\x41\x04name\x12\xf0\x01\n\rCreateVersion\x12\x30.google.cloud.dialogflow.v2.CreateVersionRequest\x1a#.google.cloud.dialogflow.v2.Version\"\x87\x01\x82\xd3\xe4\x93\x02p\"&/v2/{parent=projects/*/agent}/versions:\x07versionZ=\"2/v2/{parent=projects/*/locations/*/agent}/versions:\x07version\xda\x41\x0eparent,version\x12\x86\x02\n\rUpdateVersion\x12\x30.google.cloud.dialogflow.v2.UpdateVersionRequest\x1a#.google.cloud.dialogflow.v2.Version\"\x9d\x01\x82\xd3\xe4\x93\x02\x80\x01\x32./v2/{version.name=projects/*/agent/versions/*}:\x07versionZE2:/v2/{version.name=projects/*/locations/*/agent/versions/*}:\x07version\xda\x41\x13version,update_mask\x12\xc6\x01\n\rDeleteVersion\x12\x30.google.cloud.dialogflow.v2.DeleteVersionRequest\x1a\x16.google.protobuf.Empty\"k\x82\xd3\xe4\x93\x02^*&/v2/{name=projects/*/agent/versions/*}Z4*2/v2/{name=projects/*/locations/*/agent/versions/*}\xda\x41\x04name\x1ax\xca\x41\x19\x64ialogflow.googleapis.com\xd2\x41Yhttps://www.googleapis.com/auth/cloud-platform,https://www.googleapis.com/auth/dialogflowB\x95\x01\n\x1e\x63om.google.cloud.dialogflow.v2B\x0cVersionProtoP\x01Z>cloud.google.com/go/dialogflow/apiv2/dialogflowpb;dialogflowpb\xf8\x01\x01\xa2\x02\x02\x44\x46\xaa\x02\x1aGoogle.Cloud.Dialogflow.V2b\x06proto3"

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
    ["google.protobuf.Timestamp", "google/protobuf/timestamp.proto"],
    ["google.protobuf.FieldMask", "google/protobuf/field_mask.proto"],
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
  module Cloud
    module Dialogflow
      module V2
        Version = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Version").msgclass
        Version::VersionStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Version.VersionStatus").enummodule
        ListVersionsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.ListVersionsRequest").msgclass
        ListVersionsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.ListVersionsResponse").msgclass
        GetVersionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.GetVersionRequest").msgclass
        CreateVersionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.CreateVersionRequest").msgclass
        UpdateVersionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.UpdateVersionRequest").msgclass
        DeleteVersionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.DeleteVersionRequest").msgclass
      end
    end
  end
end