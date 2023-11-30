# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/dialogflow/v2/participant.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/dialogflow/v2/audio_config_pb'
require 'google/cloud/dialogflow/v2/session_pb'
require 'google/protobuf/field_mask_pb'
require 'google/protobuf/struct_pb'
require 'google/protobuf/timestamp_pb'
require 'google/rpc/status_pb'


descriptor_data = "\n,google/cloud/dialogflow/v2/participant.proto\x12\x1agoogle.cloud.dialogflow.v2\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a-google/cloud/dialogflow/v2/audio_config.proto\x1a(google/cloud/dialogflow/v2/session.proto\x1a google/protobuf/field_mask.proto\x1a\x1cgoogle/protobuf/struct.proto\x1a\x1fgoogle/protobuf/timestamp.proto\x1a\x17google/rpc/status.proto\"\x91\x05\n\x0bParticipant\x12\x11\n\x04name\x18\x01 \x01(\tB\x03\xe0\x41\x01\x12?\n\x04role\x18\x02 \x01(\x0e\x32,.google.cloud.dialogflow.v2.Participant.RoleB\x03\xe0\x41\x05\x12&\n\x19sip_recording_media_label\x18\x06 \x01(\tB\x03\xe0\x41\x01\x12(\n\x1bobfuscated_external_user_id\x18\x07 \x01(\tB\x03\xe0\x41\x01\x12n\n\x1a\x64ocuments_metadata_filters\x18\x08 \x03(\x0b\x32\x45.google.cloud.dialogflow.v2.Participant.DocumentsMetadataFiltersEntryB\x03\xe0\x41\x01\x1a?\n\x1d\x44ocumentsMetadataFiltersEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"P\n\x04Role\x12\x14\n\x10ROLE_UNSPECIFIED\x10\x00\x12\x0f\n\x0bHUMAN_AGENT\x10\x01\x12\x13\n\x0f\x41UTOMATED_AGENT\x10\x02\x12\x0c\n\x08\x45ND_USER\x10\x03:\xd8\x01\xea\x41\xd4\x01\n%dialogflow.googleapis.com/Participant\x12Jprojects/{project}/conversations/{conversation}/participants/{participant}\x12_projects/{project}/locations/{location}/conversations/{conversation}/participants/{participant}\"\x8c\x05\n\x07Message\x12\x11\n\x04name\x18\x01 \x01(\tB\x03\xe0\x41\x01\x12\x14\n\x07\x63ontent\x18\x02 \x01(\tB\x03\xe0\x41\x02\x12\x1a\n\rlanguage_code\x18\x03 \x01(\tB\x03\xe0\x41\x01\x12\x18\n\x0bparticipant\x18\x04 \x01(\tB\x03\xe0\x41\x03\x12K\n\x10participant_role\x18\x05 \x01(\x0e\x32,.google.cloud.dialogflow.v2.Participant.RoleB\x03\xe0\x41\x03\x12\x34\n\x0b\x63reate_time\x18\x06 \x01(\x0b\x32\x1a.google.protobuf.TimestampB\x03\xe0\x41\x03\x12\x32\n\tsend_time\x18\t \x01(\x0b\x32\x1a.google.protobuf.TimestampB\x03\xe0\x41\x01\x12N\n\x12message_annotation\x18\x07 \x01(\x0b\x32-.google.cloud.dialogflow.v2.MessageAnnotationB\x03\xe0\x41\x03\x12T\n\x12sentiment_analysis\x18\x08 \x01(\x0b\x32\x33.google.cloud.dialogflow.v2.SentimentAnalysisResultB\x03\xe0\x41\x03:\xc4\x01\xea\x41\xc0\x01\n!dialogflow.googleapis.com/Message\x12\x42projects/{project}/conversations/{conversation}/messages/{message}\x12Wprojects/{project}/locations/{location}/conversations/{conversation}/messages/{message}\"\x9c\x01\n\x18\x43reateParticipantRequest\x12=\n\x06parent\x18\x01 \x01(\tB-\xe0\x41\x02\xfa\x41\'\x12%dialogflow.googleapis.com/Participant\x12\x41\n\x0bparticipant\x18\x02 \x01(\x0b\x32\'.google.cloud.dialogflow.v2.ParticipantB\x03\xe0\x41\x02\"T\n\x15GetParticipantRequest\x12;\n\x04name\x18\x01 \x01(\tB-\xe0\x41\x02\xfa\x41\'\n%dialogflow.googleapis.com/Participant\"\x89\x01\n\x17ListParticipantsRequest\x12=\n\x06parent\x18\x01 \x01(\tB-\xe0\x41\x02\xfa\x41\'\x12%dialogflow.googleapis.com/Participant\x12\x16\n\tpage_size\x18\x02 \x01(\x05\x42\x03\xe0\x41\x01\x12\x17\n\npage_token\x18\x03 \x01(\tB\x03\xe0\x41\x01\"r\n\x18ListParticipantsResponse\x12=\n\x0cparticipants\x18\x01 \x03(\x0b\x32\'.google.cloud.dialogflow.v2.Participant\x12\x17\n\x0fnext_page_token\x18\x02 \x01(\t\"\x93\x01\n\x18UpdateParticipantRequest\x12\x41\n\x0bparticipant\x18\x01 \x01(\x0b\x32\'.google.cloud.dialogflow.v2.ParticipantB\x03\xe0\x41\x02\x12\x34\n\x0bupdate_mask\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.FieldMaskB\x03\xe0\x41\x02\"\xcb\x04\n\x15\x41nalyzeContentRequest\x12\x42\n\x0bparticipant\x18\x01 \x01(\tB-\xe0\x41\x02\xfa\x41\'\n%dialogflow.googleapis.com/Participant\x12;\n\ntext_input\x18\x06 \x01(\x0b\x32%.google.cloud.dialogflow.v2.TextInputH\x00\x12=\n\x0b\x65vent_input\x18\x08 \x01(\x0b\x32&.google.cloud.dialogflow.v2.EventInputH\x00\x12G\n\x10suggestion_input\x18\x0c \x01(\x0b\x32+.google.cloud.dialogflow.v2.SuggestionInputH\x00\x12I\n\x12reply_audio_config\x18\x05 \x01(\x0b\x32-.google.cloud.dialogflow.v2.OutputAudioConfig\x12\x41\n\x0cquery_params\x18\t \x01(\x0b\x32+.google.cloud.dialogflow.v2.QueryParameters\x12N\n\x13\x61ssist_query_params\x18\x0e \x01(\x0b\x32\x31.google.cloud.dialogflow.v2.AssistQueryParameters\x12.\n\rcx_parameters\x18\x12 \x01(\x0b\x32\x17.google.protobuf.Struct\x12\x12\n\nrequest_id\x18\x0b \x01(\tB\x07\n\x05input\",\n\x0e\x44tmfParameters\x12\x1a\n\x12\x61\x63\x63\x65pts_dtmf_input\x18\x01 \x01(\x08\"\xde\x03\n\x16\x41nalyzeContentResponse\x12\x12\n\nreply_text\x18\x01 \x01(\t\x12<\n\x0breply_audio\x18\x02 \x01(\x0b\x32\'.google.cloud.dialogflow.v2.OutputAudio\x12N\n\x15\x61utomated_agent_reply\x18\x03 \x01(\x0b\x32/.google.cloud.dialogflow.v2.AutomatedAgentReply\x12\x34\n\x07message\x18\x05 \x01(\x0b\x32#.google.cloud.dialogflow.v2.Message\x12T\n\x1ehuman_agent_suggestion_results\x18\x06 \x03(\x0b\x32,.google.cloud.dialogflow.v2.SuggestionResult\x12Q\n\x1b\x65nd_user_suggestion_results\x18\x07 \x03(\x0b\x32,.google.cloud.dialogflow.v2.SuggestionResult\x12\x43\n\x0f\x64tmf_parameters\x18\t \x01(\x0b\x32*.google.cloud.dialogflow.v2.DtmfParameters\"\xf8\x05\n\x1eStreamingAnalyzeContentRequest\x12\x42\n\x0bparticipant\x18\x01 \x01(\tB-\xe0\x41\x02\xfa\x41\'\n%dialogflow.googleapis.com/Participant\x12\x44\n\x0c\x61udio_config\x18\x02 \x01(\x0b\x32,.google.cloud.dialogflow.v2.InputAudioConfigH\x00\x12\x42\n\x0btext_config\x18\x03 \x01(\x0b\x32+.google.cloud.dialogflow.v2.InputTextConfigH\x00\x12I\n\x12reply_audio_config\x18\x04 \x01(\x0b\x32-.google.cloud.dialogflow.v2.OutputAudioConfig\x12\x15\n\x0binput_audio\x18\x05 \x01(\x0cH\x01\x12\x14\n\ninput_text\x18\x06 \x01(\tH\x01\x12\x45\n\ninput_dtmf\x18\t \x01(\x0b\x32/.google.cloud.dialogflow.v2.TelephonyDtmfEventsH\x01\x12\x41\n\x0cquery_params\x18\x07 \x01(\x0b\x32+.google.cloud.dialogflow.v2.QueryParameters\x12N\n\x13\x61ssist_query_params\x18\x08 \x01(\x0b\x32\x31.google.cloud.dialogflow.v2.AssistQueryParameters\x12.\n\rcx_parameters\x18\r \x01(\x0b\x32\x17.google.protobuf.Struct\x12&\n\x19\x65nable_extended_streaming\x18\x0b \x01(\x08\x42\x03\xe0\x41\x01\x12,\n$enable_partial_automated_agent_reply\x18\x0c \x01(\x08\x12\x1d\n\x15\x65nable_debugging_info\x18\x13 \x01(\x08\x42\x08\n\x06\x63onfigB\x07\n\x05input\"\x8f\x05\n\x1fStreamingAnalyzeContentResponse\x12R\n\x12recognition_result\x18\x01 \x01(\x0b\x32\x36.google.cloud.dialogflow.v2.StreamingRecognitionResult\x12\x12\n\nreply_text\x18\x02 \x01(\t\x12<\n\x0breply_audio\x18\x03 \x01(\x0b\x32\'.google.cloud.dialogflow.v2.OutputAudio\x12N\n\x15\x61utomated_agent_reply\x18\x04 \x01(\x0b\x32/.google.cloud.dialogflow.v2.AutomatedAgentReply\x12\x34\n\x07message\x18\x06 \x01(\x0b\x32#.google.cloud.dialogflow.v2.Message\x12T\n\x1ehuman_agent_suggestion_results\x18\x07 \x03(\x0b\x32,.google.cloud.dialogflow.v2.SuggestionResult\x12Q\n\x1b\x65nd_user_suggestion_results\x18\x08 \x03(\x0b\x32,.google.cloud.dialogflow.v2.SuggestionResult\x12\x43\n\x0f\x64tmf_parameters\x18\n \x01(\x0b\x32*.google.cloud.dialogflow.v2.DtmfParameters\x12R\n\x0e\x64\x65\x62ugging_info\x18\x0b \x01(\x0b\x32:.google.cloud.dialogflow.v2.CloudConversationDebuggingInfo\"\x85\x02\n\x16SuggestArticlesRequest\x12=\n\x06parent\x18\x01 \x01(\tB-\xe0\x41\x02\xfa\x41\'\n%dialogflow.googleapis.com/Participant\x12\x41\n\x0elatest_message\x18\x02 \x01(\tB)\xe0\x41\x01\xfa\x41#\n!dialogflow.googleapis.com/Message\x12\x19\n\x0c\x63ontext_size\x18\x03 \x01(\x05\x42\x03\xe0\x41\x01\x12N\n\x13\x61ssist_query_params\x18\x04 \x01(\x0b\x32\x31.google.cloud.dialogflow.v2.AssistQueryParameters\"\x8b\x01\n\x17SuggestArticlesResponse\x12\x42\n\x0f\x61rticle_answers\x18\x01 \x03(\x0b\x32).google.cloud.dialogflow.v2.ArticleAnswer\x12\x16\n\x0elatest_message\x18\x02 \x01(\t\x12\x14\n\x0c\x63ontext_size\x18\x03 \x01(\x05\"\x87\x02\n\x18SuggestFaqAnswersRequest\x12=\n\x06parent\x18\x01 \x01(\tB-\xe0\x41\x02\xfa\x41\'\n%dialogflow.googleapis.com/Participant\x12\x41\n\x0elatest_message\x18\x02 \x01(\tB)\xe0\x41\x01\xfa\x41#\n!dialogflow.googleapis.com/Message\x12\x19\n\x0c\x63ontext_size\x18\x03 \x01(\x05\x42\x03\xe0\x41\x01\x12N\n\x13\x61ssist_query_params\x18\x04 \x01(\x0b\x32\x31.google.cloud.dialogflow.v2.AssistQueryParameters\"\x85\x01\n\x19SuggestFaqAnswersResponse\x12:\n\x0b\x66\x61q_answers\x18\x01 \x03(\x0b\x32%.google.cloud.dialogflow.v2.FaqAnswer\x12\x16\n\x0elatest_message\x18\x02 \x01(\t\x12\x14\n\x0c\x63ontext_size\x18\x03 \x01(\x05\"\xf4\x01\n\x1aSuggestSmartRepliesRequest\x12=\n\x06parent\x18\x01 \x01(\tB-\xe0\x41\x02\xfa\x41\'\n%dialogflow.googleapis.com/Participant\x12\x41\n\x12\x63urrent_text_input\x18\x04 \x01(\x0b\x32%.google.cloud.dialogflow.v2.TextInput\x12>\n\x0elatest_message\x18\x02 \x01(\tB&\xfa\x41#\n!dialogflow.googleapis.com/Message\x12\x14\n\x0c\x63ontext_size\x18\x03 \x01(\x05\"\xc3\x01\n\x1bSuggestSmartRepliesResponse\x12N\n\x13smart_reply_answers\x18\x01 \x03(\x0b\x32,.google.cloud.dialogflow.v2.SmartReplyAnswerB\x03\xe0\x41\x03\x12>\n\x0elatest_message\x18\x02 \x01(\tB&\xfa\x41#\n!dialogflow.googleapis.com/Message\x12\x14\n\x0c\x63ontext_size\x18\x03 \x01(\x05\"[\n\x0bOutputAudio\x12=\n\x06\x63onfig\x18\x01 \x01(\x0b\x32-.google.cloud.dialogflow.v2.OutputAudioConfig\x12\r\n\x05\x61udio\x18\x02 \x01(\x0c\"\xe8\x02\n\x13\x41utomatedAgentReply\x12P\n\x16\x64\x65tect_intent_response\x18\x01 \x01(\x0b\x32\x30.google.cloud.dialogflow.v2.DetectIntentResponse\x12k\n\x1a\x61utomated_agent_reply_type\x18\x07 \x01(\x0e\x32G.google.cloud.dialogflow.v2.AutomatedAgentReply.AutomatedAgentReplyType\x12\x1a\n\x12\x61llow_cancellation\x18\x08 \x01(\x08\x12\x17\n\x0f\x63x_current_page\x18\x0b \x01(\t\"]\n\x17\x41utomatedAgentReplyType\x12*\n&AUTOMATED_AGENT_REPLY_TYPE_UNSPECIFIED\x10\x00\x12\x0b\n\x07PARTIAL\x10\x01\x12\t\n\x05\x46INAL\x10\x02\"\xe4\x01\n\rArticleAnswer\x12\r\n\x05title\x18\x01 \x01(\t\x12\x0b\n\x03uri\x18\x02 \x01(\t\x12\x10\n\x08snippets\x18\x03 \x03(\t\x12\x12\n\nconfidence\x18\x04 \x01(\x02\x12I\n\x08metadata\x18\x05 \x03(\x0b\x32\x37.google.cloud.dialogflow.v2.ArticleAnswer.MetadataEntry\x12\x15\n\ranswer_record\x18\x06 \x01(\t\x1a/\n\rMetadataEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"\xe0\x01\n\tFaqAnswer\x12\x0e\n\x06\x61nswer\x18\x01 \x01(\t\x12\x12\n\nconfidence\x18\x02 \x01(\x02\x12\x10\n\x08question\x18\x03 \x01(\t\x12\x0e\n\x06source\x18\x04 \x01(\t\x12\x45\n\x08metadata\x18\x05 \x03(\x0b\x32\x33.google.cloud.dialogflow.v2.FaqAnswer.MetadataEntry\x12\x15\n\ranswer_record\x18\x06 \x01(\t\x1a/\n\rMetadataEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"y\n\x10SmartReplyAnswer\x12\r\n\x05reply\x18\x01 \x01(\t\x12\x12\n\nconfidence\x18\x02 \x01(\x02\x12\x42\n\ranswer_record\x18\x03 \x01(\tB+\xfa\x41(\n&dialogflow.googleapis.com/AnswerRecord\"\\\n\x10IntentSuggestion\x12\x14\n\x0c\x64isplay_name\x18\x01 \x01(\t\x12\x13\n\tintent_v2\x18\x02 \x01(\tH\x00\x12\x13\n\x0b\x64\x65scription\x18\x05 \x01(\tB\x08\n\x06intent\"\xc5\x01\n\x16\x44ialogflowAssistAnswer\x12?\n\x0cquery_result\x18\x01 \x01(\x0b\x32\'.google.cloud.dialogflow.v2.QueryResultH\x00\x12I\n\x11intent_suggestion\x18\x05 \x01(\x0b\x32,.google.cloud.dialogflow.v2.IntentSuggestionH\x00\x12\x15\n\ranswer_record\x18\x02 \x01(\tB\x08\n\x06result\"\xea\x02\n\x10SuggestionResult\x12#\n\x05\x65rror\x18\x01 \x01(\x0b\x32\x12.google.rpc.StatusH\x00\x12X\n\x19suggest_articles_response\x18\x02 \x01(\x0b\x32\x33.google.cloud.dialogflow.v2.SuggestArticlesResponseH\x00\x12]\n\x1csuggest_faq_answers_response\x18\x03 \x01(\x0b\x32\x35.google.cloud.dialogflow.v2.SuggestFaqAnswersResponseH\x00\x12\x61\n\x1esuggest_smart_replies_response\x18\x04 \x01(\x0b\x32\x37.google.cloud.dialogflow.v2.SuggestSmartRepliesResponseH\x00\x42\x15\n\x13suggestion_response\"-\n\x0fInputTextConfig\x12\x1a\n\rlanguage_code\x18\x01 \x01(\tB\x03\xe0\x41\x02\"j\n\x14\x41nnotatedMessagePart\x12\x0c\n\x04text\x18\x01 \x01(\t\x12\x13\n\x0b\x65ntity_type\x18\x02 \x01(\t\x12/\n\x0f\x66ormatted_value\x18\x03 \x01(\x0b\x32\x16.google.protobuf.Value\"n\n\x11MessageAnnotation\x12?\n\x05parts\x18\x01 \x03(\x0b\x32\x30.google.cloud.dialogflow.v2.AnnotatedMessagePart\x12\x18\n\x10\x63ontain_entities\x18\x02 \x01(\x08\"-\n\x0fSuggestionInput\x12\x1a\n\ranswer_record\x18\x01 \x01(\tB\x03\xe0\x41\x02\"\xcd\x01\n\x15\x41ssistQueryParameters\x12s\n\x1a\x64ocuments_metadata_filters\x18\x01 \x03(\x0b\x32O.google.cloud.dialogflow.v2.AssistQueryParameters.DocumentsMetadataFiltersEntry\x1a?\n\x1d\x44ocumentsMetadataFiltersEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\x32\xfa\x15\n\x0cParticipants\x12\xa5\x02\n\x11\x43reateParticipant\x12\x34.google.cloud.dialogflow.v2.CreateParticipantRequest\x1a\'.google.cloud.dialogflow.v2.Participant\"\xb0\x01\x82\xd3\xe4\x93\x02\x94\x01\"4/v2/{parent=projects/*/conversations/*}/participants:\x0bparticipantZO\"@/v2/{parent=projects/*/locations/*/conversations/*}/participants:\x0bparticipant\xda\x41\x12parent,participant\x12\xf6\x01\n\x0eGetParticipant\x12\x31.google.cloud.dialogflow.v2.GetParticipantRequest\x1a\'.google.cloud.dialogflow.v2.Participant\"\x87\x01\x82\xd3\xe4\x93\x02z\x12\x34/v2/{name=projects/*/conversations/*/participants/*}ZB\x12@/v2/{name=projects/*/locations/*/conversations/*/participants/*}\xda\x41\x04name\x12\x89\x02\n\x10ListParticipants\x12\x33.google.cloud.dialogflow.v2.ListParticipantsRequest\x1a\x34.google.cloud.dialogflow.v2.ListParticipantsResponse\"\x89\x01\x82\xd3\xe4\x93\x02z\x12\x34/v2/{parent=projects/*/conversations/*}/participantsZB\x12@/v2/{parent=projects/*/locations/*/conversations/*}/participants\xda\x41\x06parent\x12\xc2\x02\n\x11UpdateParticipant\x12\x34.google.cloud.dialogflow.v2.UpdateParticipantRequest\x1a\'.google.cloud.dialogflow.v2.Participant\"\xcd\x01\x82\xd3\xe4\x93\x02\xac\x01\x32@/v2/{participant.name=projects/*/conversations/*/participants/*}:\x0bparticipantZ[2L/v2/{participant.name=projects/*/locations/*/conversations/*/participants/*}:\x0bparticipant\xda\x41\x17participant,update_mask\x12\xe0\x02\n\x0e\x41nalyzeContent\x12\x31.google.cloud.dialogflow.v2.AnalyzeContentRequest\x1a\x32.google.cloud.dialogflow.v2.AnalyzeContentResponse\"\xe6\x01\x82\xd3\xe4\x93\x02\xac\x01\"J/v2/{participant=projects/*/conversations/*/participants/*}:analyzeContent:\x01*Z[\"V/v2/{participant=projects/*/locations/*/conversations/*/participants/*}:analyzeContent:\x01*\xda\x41\x16participant,text_input\xda\x41\x17participant,event_input\x12\x98\x01\n\x17StreamingAnalyzeContent\x12:.google.cloud.dialogflow.v2.StreamingAnalyzeContentRequest\x1a;.google.cloud.dialogflow.v2.StreamingAnalyzeContentResponse\"\x00(\x01\x30\x01\x12\xc9\x02\n\x0fSuggestArticles\x12\x32.google.cloud.dialogflow.v2.SuggestArticlesRequest\x1a\x33.google.cloud.dialogflow.v2.SuggestArticlesResponse\"\xcc\x01\x82\xd3\xe4\x93\x02\xbc\x01\"R/v2/{parent=projects/*/conversations/*/participants/*}/suggestions:suggestArticles:\x01*Zc\"^/v2/{parent=projects/*/locations/*/conversations/*/participants/*}/suggestions:suggestArticles:\x01*\xda\x41\x06parent\x12\xd3\x02\n\x11SuggestFaqAnswers\x12\x34.google.cloud.dialogflow.v2.SuggestFaqAnswersRequest\x1a\x35.google.cloud.dialogflow.v2.SuggestFaqAnswersResponse\"\xd0\x01\x82\xd3\xe4\x93\x02\xc0\x01\"T/v2/{parent=projects/*/conversations/*/participants/*}/suggestions:suggestFaqAnswers:\x01*Ze\"`/v2/{parent=projects/*/locations/*/conversations/*/participants/*}/suggestions:suggestFaqAnswers:\x01*\xda\x41\x06parent\x12\xdd\x02\n\x13SuggestSmartReplies\x12\x36.google.cloud.dialogflow.v2.SuggestSmartRepliesRequest\x1a\x37.google.cloud.dialogflow.v2.SuggestSmartRepliesResponse\"\xd4\x01\x82\xd3\xe4\x93\x02\xc4\x01\"V/v2/{parent=projects/*/conversations/*/participants/*}/suggestions:suggestSmartReplies:\x01*Zg\"b/v2/{parent=projects/*/locations/*/conversations/*/participants/*}/suggestions:suggestSmartReplies:\x01*\xda\x41\x06parent\x1ax\xca\x41\x19\x64ialogflow.googleapis.com\xd2\x41Yhttps://www.googleapis.com/auth/cloud-platform,https://www.googleapis.com/auth/dialogflowB\x99\x01\n\x1e\x63om.google.cloud.dialogflow.v2B\x10ParticipantProtoP\x01Z>cloud.google.com/go/dialogflow/apiv2/dialogflowpb;dialogflowpb\xf8\x01\x01\xa2\x02\x02\x44\x46\xaa\x02\x1aGoogle.Cloud.Dialogflow.V2b\x06proto3"

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
    ["google.protobuf.Timestamp", "google/protobuf/timestamp.proto"],
    ["google.cloud.dialogflow.v2.SentimentAnalysisResult", "google/cloud/dialogflow/v2/session.proto"],
    ["google.protobuf.FieldMask", "google/protobuf/field_mask.proto"],
    ["google.cloud.dialogflow.v2.OutputAudioConfig", "google/cloud/dialogflow/v2/audio_config.proto"],
    ["google.protobuf.Struct", "google/protobuf/struct.proto"],
    ["google.rpc.Status", "google/rpc/status.proto"],
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
        Participant = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Participant").msgclass
        Participant::Role = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Participant.Role").enummodule
        Message = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Message").msgclass
        CreateParticipantRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.CreateParticipantRequest").msgclass
        GetParticipantRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.GetParticipantRequest").msgclass
        ListParticipantsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.ListParticipantsRequest").msgclass
        ListParticipantsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.ListParticipantsResponse").msgclass
        UpdateParticipantRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.UpdateParticipantRequest").msgclass
        AnalyzeContentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.AnalyzeContentRequest").msgclass
        DtmfParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.DtmfParameters").msgclass
        AnalyzeContentResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.AnalyzeContentResponse").msgclass
        StreamingAnalyzeContentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.StreamingAnalyzeContentRequest").msgclass
        StreamingAnalyzeContentResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.StreamingAnalyzeContentResponse").msgclass
        SuggestArticlesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.SuggestArticlesRequest").msgclass
        SuggestArticlesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.SuggestArticlesResponse").msgclass
        SuggestFaqAnswersRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.SuggestFaqAnswersRequest").msgclass
        SuggestFaqAnswersResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.SuggestFaqAnswersResponse").msgclass
        SuggestSmartRepliesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.SuggestSmartRepliesRequest").msgclass
        SuggestSmartRepliesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.SuggestSmartRepliesResponse").msgclass
        OutputAudio = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.OutputAudio").msgclass
        AutomatedAgentReply = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.AutomatedAgentReply").msgclass
        AutomatedAgentReply::AutomatedAgentReplyType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.AutomatedAgentReply.AutomatedAgentReplyType").enummodule
        ArticleAnswer = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.ArticleAnswer").msgclass
        FaqAnswer = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.FaqAnswer").msgclass
        SmartReplyAnswer = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.SmartReplyAnswer").msgclass
        IntentSuggestion = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.IntentSuggestion").msgclass
        DialogflowAssistAnswer = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.DialogflowAssistAnswer").msgclass
        SuggestionResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.SuggestionResult").msgclass
        InputTextConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.InputTextConfig").msgclass
        AnnotatedMessagePart = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.AnnotatedMessagePart").msgclass
        MessageAnnotation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.MessageAnnotation").msgclass
        SuggestionInput = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.SuggestionInput").msgclass
        AssistQueryParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.AssistQueryParameters").msgclass
      end
    end
  end
end