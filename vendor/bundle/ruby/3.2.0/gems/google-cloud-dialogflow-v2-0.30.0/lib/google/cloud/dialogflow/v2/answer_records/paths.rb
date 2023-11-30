# frozen_string_literal: true

# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!


module Google
  module Cloud
    module Dialogflow
      module V2
        module AnswerRecords
          # Path helper methods for the AnswerRecords API.
          module Paths
            ##
            # Create a fully-qualified AnswerRecord resource string.
            #
            # @overload answer_record_path(project:, answer_record:)
            #   The resource will be in the following format:
            #
            #   `projects/{project}/answerRecords/{answer_record}`
            #
            #   @param project [String]
            #   @param answer_record [String]
            #
            # @overload answer_record_path(project:, location:, answer_record:)
            #   The resource will be in the following format:
            #
            #   `projects/{project}/locations/{location}/answerRecords/{answer_record}`
            #
            #   @param project [String]
            #   @param location [String]
            #   @param answer_record [String]
            #
            # @return [::String]
            def answer_record_path **args
              resources = {
                "answer_record:project" => (proc do |project:, answer_record:|
                  raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"

                  "projects/#{project}/answerRecords/#{answer_record}"
                end),
                "answer_record:location:project" => (proc do |project:, location:, answer_record:|
                  raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
                  raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"

                  "projects/#{project}/locations/#{location}/answerRecords/#{answer_record}"
                end)
              }

              resource = resources[args.keys.sort.join(":")]
              raise ::ArgumentError, "no resource found for values #{args.keys}" if resource.nil?
              resource.call(**args)
            end

            ##
            # Create a fully-qualified Context resource string.
            #
            # @overload context_path(project:, session:, context:)
            #   The resource will be in the following format:
            #
            #   `projects/{project}/agent/sessions/{session}/contexts/{context}`
            #
            #   @param project [String]
            #   @param session [String]
            #   @param context [String]
            #
            # @overload context_path(project:, environment:, user:, session:, context:)
            #   The resource will be in the following format:
            #
            #   `projects/{project}/agent/environments/{environment}/users/{user}/sessions/{session}/contexts/{context}`
            #
            #   @param project [String]
            #   @param environment [String]
            #   @param user [String]
            #   @param session [String]
            #   @param context [String]
            #
            # @overload context_path(project:, location:, session:, context:)
            #   The resource will be in the following format:
            #
            #   `projects/{project}/locations/{location}/agent/sessions/{session}/contexts/{context}`
            #
            #   @param project [String]
            #   @param location [String]
            #   @param session [String]
            #   @param context [String]
            #
            # @overload context_path(project:, location:, environment:, user:, session:, context:)
            #   The resource will be in the following format:
            #
            #   `projects/{project}/locations/{location}/agent/environments/{environment}/users/{user}/sessions/{session}/contexts/{context}`
            #
            #   @param project [String]
            #   @param location [String]
            #   @param environment [String]
            #   @param user [String]
            #   @param session [String]
            #   @param context [String]
            #
            # @return [::String]
            def context_path **args
              resources = {
                "context:project:session" => (proc do |project:, session:, context:|
                  raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
                  raise ::ArgumentError, "session cannot contain /" if session.to_s.include? "/"

                  "projects/#{project}/agent/sessions/#{session}/contexts/#{context}"
                end),
                "context:environment:project:session:user" => (proc do |project:, environment:, user:, session:, context:|
                  raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
                  raise ::ArgumentError, "environment cannot contain /" if environment.to_s.include? "/"
                  raise ::ArgumentError, "user cannot contain /" if user.to_s.include? "/"
                  raise ::ArgumentError, "session cannot contain /" if session.to_s.include? "/"

                  "projects/#{project}/agent/environments/#{environment}/users/#{user}/sessions/#{session}/contexts/#{context}"
                end),
                "context:location:project:session" => (proc do |project:, location:, session:, context:|
                  raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
                  raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"
                  raise ::ArgumentError, "session cannot contain /" if session.to_s.include? "/"

                  "projects/#{project}/locations/#{location}/agent/sessions/#{session}/contexts/#{context}"
                end),
                "context:environment:location:project:session:user" => (proc do |project:, location:, environment:, user:, session:, context:|
                  raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
                  raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"
                  raise ::ArgumentError, "environment cannot contain /" if environment.to_s.include? "/"
                  raise ::ArgumentError, "user cannot contain /" if user.to_s.include? "/"
                  raise ::ArgumentError, "session cannot contain /" if session.to_s.include? "/"

                  "projects/#{project}/locations/#{location}/agent/environments/#{environment}/users/#{user}/sessions/#{session}/contexts/#{context}"
                end)
              }

              resource = resources[args.keys.sort.join(":")]
              raise ::ArgumentError, "no resource found for values #{args.keys}" if resource.nil?
              resource.call(**args)
            end

            ##
            # Create a fully-qualified Intent resource string.
            #
            # @overload intent_path(project:, intent:)
            #   The resource will be in the following format:
            #
            #   `projects/{project}/agent/intents/{intent}`
            #
            #   @param project [String]
            #   @param intent [String]
            #
            # @overload intent_path(project:, location:, intent:)
            #   The resource will be in the following format:
            #
            #   `projects/{project}/locations/{location}/agent/intents/{intent}`
            #
            #   @param project [String]
            #   @param location [String]
            #   @param intent [String]
            #
            # @return [::String]
            def intent_path **args
              resources = {
                "intent:project" => (proc do |project:, intent:|
                  raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"

                  "projects/#{project}/agent/intents/#{intent}"
                end),
                "intent:location:project" => (proc do |project:, location:, intent:|
                  raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
                  raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"

                  "projects/#{project}/locations/#{location}/agent/intents/#{intent}"
                end)
              }

              resource = resources[args.keys.sort.join(":")]
              raise ::ArgumentError, "no resource found for values #{args.keys}" if resource.nil?
              resource.call(**args)
            end

            ##
            # Create a fully-qualified Location resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}`
            #
            # @param project [String]
            # @param location [String]
            #
            # @return [::String]
            def location_path project:, location:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"

              "projects/#{project}/locations/#{location}"
            end

            ##
            # Create a fully-qualified Project resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}`
            #
            # @param project [String]
            #
            # @return [::String]
            def project_path project:
              "projects/#{project}"
            end

            extend self
          end
        end
      end
    end
  end
end