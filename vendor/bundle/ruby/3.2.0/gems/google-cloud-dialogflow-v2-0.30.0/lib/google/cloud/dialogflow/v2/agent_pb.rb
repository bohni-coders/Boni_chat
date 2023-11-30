# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/dialogflow/v2/agent.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/dialogflow/v2/validation_result_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/empty_pb'
require 'google/protobuf/field_mask_pb'
require 'google/protobuf/struct_pb'


descriptor_data = "\n&google/cloud/dialogflow/v2/agent.proto\x12\x1agoogle.cloud.dialogflow.v2\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a\x32google/cloud/dialogflow/v2/validation_result.proto\x1a#google/longrunning/operations.proto\x1a\x1bgoogle/protobuf/empty.proto\x1a google/protobuf/field_mask.proto\x1a\x1cgoogle/protobuf/struct.proto\"\xa5\x07\n\x05\x41gent\x12\x43\n\x06parent\x18\x01 \x01(\tB3\xe0\x41\x02\xfa\x41-\n+cloudresourcemanager.googleapis.com/Project\x12\x19\n\x0c\x64isplay_name\x18\x02 \x01(\tB\x03\xe0\x41\x02\x12\"\n\x15\x64\x65\x66\x61ult_language_code\x18\x03 \x01(\tB\x03\xe0\x41\x02\x12%\n\x18supported_language_codes\x18\x04 \x03(\tB\x03\xe0\x41\x01\x12\x16\n\ttime_zone\x18\x05 \x01(\tB\x03\xe0\x41\x02\x12\x18\n\x0b\x64\x65scription\x18\x06 \x01(\tB\x03\xe0\x41\x01\x12\x17\n\navatar_uri\x18\x07 \x01(\tB\x03\xe0\x41\x01\x12\x1b\n\x0e\x65nable_logging\x18\x08 \x01(\x08\x42\x03\xe0\x41\x01\x12\x46\n\nmatch_mode\x18\t \x01(\x0e\x32+.google.cloud.dialogflow.v2.Agent.MatchModeB\x05\x18\x01\xe0\x41\x01\x12%\n\x18\x63lassification_threshold\x18\n \x01(\x02\x42\x03\xe0\x41\x01\x12\x46\n\x0b\x61pi_version\x18\x0e \x01(\x0e\x32,.google.cloud.dialogflow.v2.Agent.ApiVersionB\x03\xe0\x41\x01\x12\x39\n\x04tier\x18\x0f \x01(\x0e\x32&.google.cloud.dialogflow.v2.Agent.TierB\x03\xe0\x41\x01\"V\n\tMatchMode\x12\x1a\n\x16MATCH_MODE_UNSPECIFIED\x10\x00\x12\x15\n\x11MATCH_MODE_HYBRID\x10\x01\x12\x16\n\x12MATCH_MODE_ML_ONLY\x10\x02\"l\n\nApiVersion\x12\x1b\n\x17\x41PI_VERSION_UNSPECIFIED\x10\x00\x12\x12\n\x0e\x41PI_VERSION_V1\x10\x01\x12\x12\n\x0e\x41PI_VERSION_V2\x10\x02\x12\x19\n\x15\x41PI_VERSION_V2_BETA_1\x10\x03\"b\n\x04Tier\x12\x14\n\x10TIER_UNSPECIFIED\x10\x00\x12\x11\n\rTIER_STANDARD\x10\x01\x12\x13\n\x0fTIER_ENTERPRISE\x10\x02\x12\x1c\n\x14TIER_ENTERPRISE_PLUS\x10\x03\x1a\x02\x08\x01:m\xea\x41j\n\x1f\x64ialogflow.googleapis.com/Agent\x12\x18projects/{project}/agent\x12-projects/{project}/locations/{location}/agent\"J\n\x0fGetAgentRequest\x12\x37\n\x06parent\x18\x01 \x01(\tB\'\xe0\x41\x02\xfa\x41!\x12\x1f\x64ialogflow.googleapis.com/Agent\"~\n\x0fSetAgentRequest\x12\x35\n\x05\x61gent\x18\x01 \x01(\x0b\x32!.google.cloud.dialogflow.v2.AgentB\x03\xe0\x41\x02\x12\x34\n\x0bupdate_mask\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.FieldMaskB\x03\xe0\x41\x01\"M\n\x12\x44\x65leteAgentRequest\x12\x37\n\x06parent\x18\x01 \x01(\tB\'\xe0\x41\x02\xfa\x41!\x12\x1f\x64ialogflow.googleapis.com/Agent\"z\n\x13SearchAgentsRequest\x12\x37\n\x06parent\x18\x01 \x01(\tB\'\xe0\x41\x02\xfa\x41!\x12\x1f\x64ialogflow.googleapis.com/Agent\x12\x16\n\tpage_size\x18\x02 \x01(\x05\x42\x03\xe0\x41\x01\x12\x12\n\npage_token\x18\x03 \x01(\t\"b\n\x14SearchAgentsResponse\x12\x31\n\x06\x61gents\x18\x01 \x03(\x0b\x32!.google.cloud.dialogflow.v2.Agent\x12\x17\n\x0fnext_page_token\x18\x02 \x01(\t\"L\n\x11TrainAgentRequest\x12\x37\n\x06parent\x18\x01 \x01(\tB\'\xe0\x41\x02\xfa\x41!\x12\x1f\x64ialogflow.googleapis.com/Agent\"e\n\x12\x45xportAgentRequest\x12\x37\n\x06parent\x18\x01 \x01(\tB\'\xe0\x41\x02\xfa\x41!\x12\x1f\x64ialogflow.googleapis.com/Agent\x12\x16\n\tagent_uri\x18\x02 \x01(\tB\x03\xe0\x41\x02\"L\n\x13\x45xportAgentResponse\x12\x13\n\tagent_uri\x18\x01 \x01(\tH\x00\x12\x17\n\ragent_content\x18\x02 \x01(\x0cH\x00\x42\x07\n\x05\x61gent\"\x84\x01\n\x12ImportAgentRequest\x12\x37\n\x06parent\x18\x01 \x01(\tB\'\xe0\x41\x02\xfa\x41!\x12\x1f\x64ialogflow.googleapis.com/Agent\x12\x13\n\tagent_uri\x18\x02 \x01(\tH\x00\x12\x17\n\ragent_content\x18\x03 \x01(\x0cH\x00\x42\x07\n\x05\x61gent\"\x85\x01\n\x13RestoreAgentRequest\x12\x37\n\x06parent\x18\x01 \x01(\tB\'\xe0\x41\x02\xfa\x41!\x12\x1f\x64ialogflow.googleapis.com/Agent\x12\x13\n\tagent_uri\x18\x02 \x01(\tH\x00\x12\x17\n\ragent_content\x18\x03 \x01(\x0cH\x00\x42\x07\n\x05\x61gent\"q\n\x1aGetValidationResultRequest\x12\x37\n\x06parent\x18\x01 \x01(\tB\'\xe0\x41\x02\xfa\x41!\x12\x1f\x64ialogflow.googleapis.com/Agent\x12\x1a\n\rlanguage_code\x18\x03 \x01(\tB\x03\xe0\x41\x01\x32\xaa\x11\n\x06\x41gents\x12\xb7\x01\n\x08GetAgent\x12+.google.cloud.dialogflow.v2.GetAgentRequest\x1a!.google.cloud.dialogflow.v2.Agent\"[\x82\xd3\xe4\x93\x02L\x12\x1d/v2/{parent=projects/*}/agentZ+\x12)/v2/{parent=projects/*/locations/*}/agent\xda\x41\x06parent\x12\xd0\x01\n\x08SetAgent\x12+.google.cloud.dialogflow.v2.SetAgentRequest\x1a!.google.cloud.dialogflow.v2.Agent\"t\x82\xd3\xe4\x93\x02\x66\"#/v2/{agent.parent=projects/*}/agent:\x05\x61gentZ8\"//v2/{agent.parent=projects/*/locations/*}/agent:\x05\x61gent\xda\x41\x05\x61gent\x12\xb2\x01\n\x0b\x44\x65leteAgent\x12..google.cloud.dialogflow.v2.DeleteAgentRequest\x1a\x16.google.protobuf.Empty\"[\x82\xd3\xe4\x93\x02L*\x1d/v2/{parent=projects/*}/agentZ+*)/v2/{parent=projects/*/locations/*}/agent\xda\x41\x06parent\x12\xdc\x01\n\x0cSearchAgents\x12/.google.cloud.dialogflow.v2.SearchAgentsRequest\x1a\x30.google.cloud.dialogflow.v2.SearchAgentsResponse\"i\x82\xd3\xe4\x93\x02Z\x12$/v2/{parent=projects/*}/agent:searchZ2\x12\x30/v2/{parent=projects/*/locations/*}/agent:search\xda\x41\x06parent\x12\xfc\x01\n\nTrainAgent\x12-.google.cloud.dialogflow.v2.TrainAgentRequest\x1a\x1d.google.longrunning.Operation\"\x9f\x01\x82\xd3\xe4\x93\x02^\"#/v2/{parent=projects/*}/agent:train:\x01*Z4\"//v2/{parent=projects/*/locations/*}/agent:train:\x01*\xda\x41\x06parent\xca\x41/\n\x15google.protobuf.Empty\x12\x16google.protobuf.Struct\x12\x99\x02\n\x0b\x45xportAgent\x12..google.cloud.dialogflow.v2.ExportAgentRequest\x1a\x1d.google.longrunning.Operation\"\xba\x01\x82\xd3\xe4\x93\x02`\"$/v2/{parent=projects/*}/agent:export:\x01*Z5\"0/v2/{parent=projects/*/locations/*}/agent:export:\x01*\xda\x41\x06parent\xca\x41H\n.google.cloud.dialogflow.v2.ExportAgentResponse\x12\x16google.protobuf.Struct\x12\xf7\x01\n\x0bImportAgent\x12..google.cloud.dialogflow.v2.ImportAgentRequest\x1a\x1d.google.longrunning.Operation\"\x98\x01\x82\xd3\xe4\x93\x02`\"$/v2/{parent=projects/*}/agent:import:\x01*Z5\"0/v2/{parent=projects/*/locations/*}/agent:import:\x01*\xca\x41/\n\x15google.protobuf.Empty\x12\x16google.protobuf.Struct\x12\xfb\x01\n\x0cRestoreAgent\x12/.google.cloud.dialogflow.v2.RestoreAgentRequest\x1a\x1d.google.longrunning.Operation\"\x9a\x01\x82\xd3\xe4\x93\x02\x62\"%/v2/{parent=projects/*}/agent:restore:\x01*Z6\"1/v2/{parent=projects/*/locations/*}/agent:restore:\x01*\xca\x41/\n\x15google.protobuf.Empty\x12\x16google.protobuf.Struct\x12\xf1\x01\n\x13GetValidationResult\x12\x36.google.cloud.dialogflow.v2.GetValidationResultRequest\x1a,.google.cloud.dialogflow.v2.ValidationResult\"t\x82\xd3\xe4\x93\x02n\x12./v2/{parent=projects/*}/agent/validationResultZ<\x12:/v2/{parent=projects/*/locations/*}/agent/validationResult\x1ax\xca\x41\x19\x64ialogflow.googleapis.com\xd2\x41Yhttps://www.googleapis.com/auth/cloud-platform,https://www.googleapis.com/auth/dialogflowB\x93\x01\n\x1e\x63om.google.cloud.dialogflow.v2B\nAgentProtoP\x01Z>cloud.google.com/go/dialogflow/apiv2/dialogflowpb;dialogflowpb\xf8\x01\x01\xa2\x02\x02\x44\x46\xaa\x02\x1aGoogle.Cloud.Dialogflow.V2b\x06proto3"

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
        Agent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Agent").msgclass
        Agent::MatchMode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Agent.MatchMode").enummodule
        Agent::ApiVersion = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Agent.ApiVersion").enummodule
        Agent::Tier = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Agent.Tier").enummodule
        GetAgentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.GetAgentRequest").msgclass
        SetAgentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.SetAgentRequest").msgclass
        DeleteAgentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.DeleteAgentRequest").msgclass
        SearchAgentsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.SearchAgentsRequest").msgclass
        SearchAgentsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.SearchAgentsResponse").msgclass
        TrainAgentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.TrainAgentRequest").msgclass
        ExportAgentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.ExportAgentRequest").msgclass
        ExportAgentResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.ExportAgentResponse").msgclass
        ImportAgentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.ImportAgentRequest").msgclass
        RestoreAgentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.RestoreAgentRequest").msgclass
        GetValidationResultRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.GetValidationResultRequest").msgclass
      end
    end
  end
end