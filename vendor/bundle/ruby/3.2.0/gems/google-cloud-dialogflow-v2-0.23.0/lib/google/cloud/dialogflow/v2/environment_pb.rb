# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/dialogflow/v2/environment.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/dialogflow/v2/audio_config_pb'
require 'google/cloud/dialogflow/v2/fulfillment_pb'
require 'google/protobuf/empty_pb'
require 'google/protobuf/field_mask_pb'
require 'google/protobuf/timestamp_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/dialogflow/v2/environment.proto", :syntax => :proto3) do
    add_message "google.cloud.dialogflow.v2.Environment" do
      optional :name, :string, 1
      optional :description, :string, 2
      optional :agent_version, :string, 3
      optional :state, :enum, 4, "google.cloud.dialogflow.v2.Environment.State"
      optional :update_time, :message, 5, "google.protobuf.Timestamp"
      optional :text_to_speech_settings, :message, 7, "google.cloud.dialogflow.v2.TextToSpeechSettings"
      optional :fulfillment, :message, 8, "google.cloud.dialogflow.v2.Fulfillment"
    end
    add_enum "google.cloud.dialogflow.v2.Environment.State" do
      value :STATE_UNSPECIFIED, 0
      value :STOPPED, 1
      value :LOADING, 2
      value :RUNNING, 3
    end
    add_message "google.cloud.dialogflow.v2.TextToSpeechSettings" do
      optional :enable_text_to_speech, :bool, 1
      optional :output_audio_encoding, :enum, 2, "google.cloud.dialogflow.v2.OutputAudioEncoding"
      optional :sample_rate_hertz, :int32, 3
      map :synthesize_speech_configs, :string, :message, 4, "google.cloud.dialogflow.v2.SynthesizeSpeechConfig"
    end
    add_message "google.cloud.dialogflow.v2.ListEnvironmentsRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
    end
    add_message "google.cloud.dialogflow.v2.ListEnvironmentsResponse" do
      repeated :environments, :message, 1, "google.cloud.dialogflow.v2.Environment"
      optional :next_page_token, :string, 2
    end
    add_message "google.cloud.dialogflow.v2.GetEnvironmentRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.dialogflow.v2.CreateEnvironmentRequest" do
      optional :parent, :string, 1
      optional :environment, :message, 2, "google.cloud.dialogflow.v2.Environment"
      optional :environment_id, :string, 3
    end
    add_message "google.cloud.dialogflow.v2.UpdateEnvironmentRequest" do
      optional :environment, :message, 1, "google.cloud.dialogflow.v2.Environment"
      optional :update_mask, :message, 2, "google.protobuf.FieldMask"
      optional :allow_load_to_draft_and_discard_changes, :bool, 3
    end
    add_message "google.cloud.dialogflow.v2.DeleteEnvironmentRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.dialogflow.v2.GetEnvironmentHistoryRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
    end
    add_message "google.cloud.dialogflow.v2.EnvironmentHistory" do
      optional :parent, :string, 1
      repeated :entries, :message, 2, "google.cloud.dialogflow.v2.EnvironmentHistory.Entry"
      optional :next_page_token, :string, 3
    end
    add_message "google.cloud.dialogflow.v2.EnvironmentHistory.Entry" do
      optional :agent_version, :string, 1
      optional :description, :string, 2
      optional :create_time, :message, 3, "google.protobuf.Timestamp"
    end
  end
end

module Google
  module Cloud
    module Dialogflow
      module V2
        Environment = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Environment").msgclass
        Environment::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Environment.State").enummodule
        TextToSpeechSettings = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.TextToSpeechSettings").msgclass
        ListEnvironmentsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.ListEnvironmentsRequest").msgclass
        ListEnvironmentsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.ListEnvironmentsResponse").msgclass
        GetEnvironmentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.GetEnvironmentRequest").msgclass
        CreateEnvironmentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.CreateEnvironmentRequest").msgclass
        UpdateEnvironmentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.UpdateEnvironmentRequest").msgclass
        DeleteEnvironmentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.DeleteEnvironmentRequest").msgclass
        GetEnvironmentHistoryRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.GetEnvironmentHistoryRequest").msgclass
        EnvironmentHistory = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.EnvironmentHistory").msgclass
        EnvironmentHistory::Entry = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.EnvironmentHistory.Entry").msgclass
      end
    end
  end
end