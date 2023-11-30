# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/dialogflow/v2/validation_result.proto

require 'google/protobuf'


descriptor_data = "\n2google/cloud/dialogflow/v2/validation_result.proto\x12\x1agoogle.cloud.dialogflow.v2\"\xd7\x01\n\x0fValidationError\x12\x46\n\x08severity\x18\x01 \x01(\x0e\x32\x34.google.cloud.dialogflow.v2.ValidationError.Severity\x12\x0f\n\x07\x65ntries\x18\x03 \x03(\t\x12\x15\n\rerror_message\x18\x04 \x01(\t\"T\n\x08Severity\x12\x18\n\x14SEVERITY_UNSPECIFIED\x10\x00\x12\x08\n\x04INFO\x10\x01\x12\x0b\n\x07WARNING\x10\x02\x12\t\n\x05\x45RROR\x10\x03\x12\x0c\n\x08\x43RITICAL\x10\x04\"Z\n\x10ValidationResult\x12\x46\n\x11validation_errors\x18\x01 \x03(\x0b\x32+.google.cloud.dialogflow.v2.ValidationErrorB\x9e\x01\n\x1e\x63om.google.cloud.dialogflow.v2B\x15ValidationResultProtoP\x01Z>cloud.google.com/go/dialogflow/apiv2/dialogflowpb;dialogflowpb\xf8\x01\x01\xa2\x02\x02\x44\x46\xaa\x02\x1aGoogle.Cloud.Dialogflow.V2b\x06proto3"

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
  module Cloud
    module Dialogflow
      module V2
        ValidationError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.ValidationError").msgclass
        ValidationError::Severity = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.ValidationError.Severity").enummodule
        ValidationResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.ValidationResult").msgclass
      end
    end
  end
end