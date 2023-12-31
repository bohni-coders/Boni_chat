# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/api/monitored_resource.proto

require 'google/protobuf'

require 'google/api/label_pb'
require 'google/api/launch_stage_pb'
require 'google/protobuf/struct_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/api/monitored_resource.proto", :syntax => :proto3) do
    add_message "google.api.MonitoredResourceDescriptor" do
      optional :name, :string, 5
      optional :type, :string, 1
      optional :display_name, :string, 2
      optional :description, :string, 3
      repeated :labels, :message, 4, "google.api.LabelDescriptor"
      optional :launch_stage, :enum, 7, "google.api.LaunchStage"
    end
    add_message "google.api.MonitoredResource" do
      optional :type, :string, 1
      map :labels, :string, :string, 2
    end
    add_message "google.api.MonitoredResourceMetadata" do
      optional :system_labels, :message, 1, "google.protobuf.Struct"
      map :user_labels, :string, :string, 2
    end
  end
end

module Google
  module Api
    MonitoredResourceDescriptor = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.MonitoredResourceDescriptor").msgclass
    MonitoredResource = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.MonitoredResource").msgclass
    MonitoredResourceMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.MonitoredResourceMetadata").msgclass
  end
end
