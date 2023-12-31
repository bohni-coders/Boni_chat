# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/cloud/dialogflow/v2/knowledge_base.proto for package 'google.cloud.dialogflow.v2'
# Original file comments:
# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'grpc'
require 'google/cloud/dialogflow/v2/knowledge_base_pb'

module Google
  module Cloud
    module Dialogflow
      module V2
        module KnowledgeBases
          # Service for managing
          # [KnowledgeBases][google.cloud.dialogflow.v2.KnowledgeBase].
          class Service

            include ::GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = 'google.cloud.dialogflow.v2.KnowledgeBases'

            # Returns the list of all knowledge bases of the specified agent.
            rpc :ListKnowledgeBases, ::Google::Cloud::Dialogflow::V2::ListKnowledgeBasesRequest, ::Google::Cloud::Dialogflow::V2::ListKnowledgeBasesResponse
            # Retrieves the specified knowledge base.
            rpc :GetKnowledgeBase, ::Google::Cloud::Dialogflow::V2::GetKnowledgeBaseRequest, ::Google::Cloud::Dialogflow::V2::KnowledgeBase
            # Creates a knowledge base.
            rpc :CreateKnowledgeBase, ::Google::Cloud::Dialogflow::V2::CreateKnowledgeBaseRequest, ::Google::Cloud::Dialogflow::V2::KnowledgeBase
            # Deletes the specified knowledge base.
            rpc :DeleteKnowledgeBase, ::Google::Cloud::Dialogflow::V2::DeleteKnowledgeBaseRequest, ::Google::Protobuf::Empty
            # Updates the specified knowledge base.
            rpc :UpdateKnowledgeBase, ::Google::Cloud::Dialogflow::V2::UpdateKnowledgeBaseRequest, ::Google::Cloud::Dialogflow::V2::KnowledgeBase
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end
