# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

module Slack
  module Web
    module Api
      module Endpoints
        module Workflows
          #
          # Indicate that an app's step in a workflow completed execution.
          #
          # @option options [string] :workflow_step_execute_id
          #   Context identifier that maps to the correct workflow step execution.
          # @option options [object] :outputs
          #   Key-value object of outputs from your step. Keys of this object reflect the configured key properties of your outputs array from your workflow_step object.
          # @see https://api.slack.com/methods/workflows.stepCompleted
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/workflows/workflows.stepCompleted.json
          def workflows_stepCompleted(options = {})
            raise ArgumentError, 'Required arguments :workflow_step_execute_id missing' if options[:workflow_step_execute_id].nil?
            post('workflows.stepCompleted', options)
          end

          #
          # Indicate that an app's step in a workflow failed to execute.
          #
          # @option options [object] :error
          #   A JSON-based object with a message property that should contain a human readable error message.
          # @option options [string] :workflow_step_execute_id
          #   Context identifier that maps to the correct workflow step execution.
          # @see https://api.slack.com/methods/workflows.stepFailed
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/workflows/workflows.stepFailed.json
          def workflows_stepFailed(options = {})
            raise ArgumentError, 'Required arguments :error missing' if options[:error].nil?
            raise ArgumentError, 'Required arguments :workflow_step_execute_id missing' if options[:workflow_step_execute_id].nil?
            post('workflows.stepFailed', options)
          end

          #
          # Update the configuration for a workflow step.
          #
          # @option options [string] :workflow_step_edit_id
          #   A context identifier provided with view_submission payloads used to call back to workflows.updateStep.
          # @option options [object] :inputs
          #   A JSON key-value map of inputs required from a user during configuration. This is the data your app expects to receive when the workflow step starts. Please note: the embedded variable format is set and replaced by the workflow system. You cannot create custom variables that will be replaced at runtime. Read more about variables in workflow steps here.
          # @option options [array] :outputs
          #   An JSON array of output objects used during step execution. This is the data your app agrees to provide when your workflow step was executed.
          # @option options [string] :step_image_url
          #   An optional field that can be used to override app image that is shown in the Workflow Builder.
          # @option options [string] :step_name
          #   An optional field that can be used to override the step name that is shown in the Workflow Builder.
          # @see https://api.slack.com/methods/workflows.updateStep
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/workflows/workflows.updateStep.json
          def workflows_updateStep(options = {})
            raise ArgumentError, 'Required arguments :workflow_step_edit_id missing' if options[:workflow_step_edit_id].nil?
            post('workflows.updateStep', options)
          end
        end
      end
    end
  end
end
