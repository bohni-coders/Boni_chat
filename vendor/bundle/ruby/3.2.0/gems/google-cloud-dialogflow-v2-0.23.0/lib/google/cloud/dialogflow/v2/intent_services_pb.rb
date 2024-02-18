# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/cloud/dialogflow/v2/intent.proto for package 'google.cloud.dialogflow.v2'
# Original file comments:
# Copyright 2020 Google LLC
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
require 'google/cloud/dialogflow/v2/intent_pb'

module Google
  module Cloud
    module Dialogflow
      module V2
        module Intents
          # Service for managing [Intents][google.cloud.dialogflow.v2.Intent].
          class Service

            include ::GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = 'google.cloud.dialogflow.v2.Intents'

            # Returns the list of all intents in the specified agent.
            rpc :ListIntents, ::Google::Cloud::Dialogflow::V2::ListIntentsRequest, ::Google::Cloud::Dialogflow::V2::ListIntentsResponse
            # Retrieves the specified intent.
            rpc :GetIntent, ::Google::Cloud::Dialogflow::V2::GetIntentRequest, ::Google::Cloud::Dialogflow::V2::Intent
            # Creates an intent in the specified agent.
            #
            # Note: You should always train an agent prior to sending it queries. See the
            # [training
            # documentation](https://cloud.google.com/dialogflow/es/docs/training).
            rpc :CreateIntent, ::Google::Cloud::Dialogflow::V2::CreateIntentRequest, ::Google::Cloud::Dialogflow::V2::Intent
            # Updates the specified intent.
            #
            # Note: You should always train an agent prior to sending it queries. See the
            # [training
            # documentation](https://cloud.google.com/dialogflow/es/docs/training).
            rpc :UpdateIntent, ::Google::Cloud::Dialogflow::V2::UpdateIntentRequest, ::Google::Cloud::Dialogflow::V2::Intent
            # Deletes the specified intent and its direct or indirect followup intents.
            #
            # Note: You should always train an agent prior to sending it queries. See the
            # [training
            # documentation](https://cloud.google.com/dialogflow/es/docs/training).
            rpc :DeleteIntent, ::Google::Cloud::Dialogflow::V2::DeleteIntentRequest, ::Google::Protobuf::Empty
            # Updates/Creates multiple intents in the specified agent.
            #
            # This method is a [long-running
            # operation](https://cloud.google.com/dialogflow/es/docs/how/long-running-operations).
            # The returned `Operation` type has the following method-specific fields:
            #
            # - `metadata`: An empty [Struct
            #   message](https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#struct)
            # - `response`:
            # [BatchUpdateIntentsResponse][google.cloud.dialogflow.v2.BatchUpdateIntentsResponse]
            #
            # Note: You should always train an agent prior to sending it queries. See the
            # [training
            # documentation](https://cloud.google.com/dialogflow/es/docs/training).
            rpc :BatchUpdateIntents, ::Google::Cloud::Dialogflow::V2::BatchUpdateIntentsRequest, ::Google::Longrunning::Operation
            # Deletes intents in the specified agent.
            #
            # This method is a [long-running
            # operation](https://cloud.google.com/dialogflow/es/docs/how/long-running-operations).
            # The returned `Operation` type has the following method-specific fields:
            #
            # - `metadata`: An empty [Struct
            #   message](https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#struct)
            # - `response`: An [Empty
            #   message](https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#empty)
            #
            # Note: You should always train an agent prior to sending it queries. See the
            # [training
            # documentation](https://cloud.google.com/dialogflow/es/docs/training).
            rpc :BatchDeleteIntents, ::Google::Cloud::Dialogflow::V2::BatchDeleteIntentsRequest, ::Google::Longrunning::Operation
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end