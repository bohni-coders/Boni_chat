# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/cloud/dialogflow/v2/conversation.proto for package 'google.cloud.dialogflow.v2'
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
require 'google/cloud/dialogflow/v2/conversation_pb'

module Google
  module Cloud
    module Dialogflow
      module V2
        module Conversations
          # Service for managing
          # [Conversations][google.cloud.dialogflow.v2.Conversation].
          class Service

            include ::GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = 'google.cloud.dialogflow.v2.Conversations'

            # Creates a new conversation. Conversations are auto-completed after 24
            # hours.
            #
            # Conversation Lifecycle:
            # There are two stages during a conversation: Automated Agent Stage and
            # Assist Stage.
            #
            # For Automated Agent Stage, there will be a dialogflow agent responding to
            # user queries.
            #
            # For Assist Stage, there's no dialogflow agent responding to user queries.
            # But we will provide suggestions which are generated from conversation.
            #
            # If
            # [Conversation.conversation_profile][google.cloud.dialogflow.v2.Conversation.conversation_profile]
            # is configured for a dialogflow agent, conversation will start from
            # `Automated Agent Stage`, otherwise, it will start from `Assist Stage`. And
            # during `Automated Agent Stage`, once an
            # [Intent][google.cloud.dialogflow.v2.Intent] with
            # [Intent.live_agent_handoff][google.cloud.dialogflow.v2.Intent.live_agent_handoff]
            # is triggered, conversation will transfer to Assist Stage.
            rpc :CreateConversation, ::Google::Cloud::Dialogflow::V2::CreateConversationRequest, ::Google::Cloud::Dialogflow::V2::Conversation
            # Returns the list of all conversations in the specified project.
            rpc :ListConversations, ::Google::Cloud::Dialogflow::V2::ListConversationsRequest, ::Google::Cloud::Dialogflow::V2::ListConversationsResponse
            # Retrieves the specific conversation.
            rpc :GetConversation, ::Google::Cloud::Dialogflow::V2::GetConversationRequest, ::Google::Cloud::Dialogflow::V2::Conversation
            # Completes the specified conversation. Finished conversations are purged
            # from the database after 30 days.
            rpc :CompleteConversation, ::Google::Cloud::Dialogflow::V2::CompleteConversationRequest, ::Google::Cloud::Dialogflow::V2::Conversation
            # Lists messages that belong to a given conversation.
            # `messages` are ordered by `create_time` in descending order. To fetch
            # updates without duplication, send request with filter
            # `create_time_epoch_microseconds >
            # [first item's create_time of previous request]` and empty page_token.
            rpc :ListMessages, ::Google::Cloud::Dialogflow::V2::ListMessagesRequest, ::Google::Cloud::Dialogflow::V2::ListMessagesResponse
            # Suggests summary for a conversation based on specific historical messages.
            # The range of the messages to be used for summary can be specified in the
            # request.
            rpc :SuggestConversationSummary, ::Google::Cloud::Dialogflow::V2::SuggestConversationSummaryRequest, ::Google::Cloud::Dialogflow::V2::SuggestConversationSummaryResponse
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end