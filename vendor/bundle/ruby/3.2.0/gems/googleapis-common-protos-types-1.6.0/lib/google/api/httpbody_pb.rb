# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/api/httpbody.proto

require 'google/protobuf'

require 'google/protobuf/any_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/api/httpbody.proto", :syntax => :proto3) do
    add_message "google.api.HttpBody" do
      optional :content_type, :string, 1
      optional :data, :bytes, 2
      repeated :extensions, :message, 3, "google.protobuf.Any"
    end
  end
end

module Google
  module Api
    HttpBody = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.HttpBody").msgclass
  end
end
