# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/dialogflow/v2/intent.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/dialogflow/v2/context_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/empty_pb'
require 'google/protobuf/field_mask_pb'
require 'google/protobuf/struct_pb'


descriptor_data = "\n\'google/cloud/dialogflow/v2/intent.proto\x12\x1agoogle.cloud.dialogflow.v2\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a(google/cloud/dialogflow/v2/context.proto\x1a#google/longrunning/operations.proto\x1a\x1bgoogle/protobuf/empty.proto\x1a google/protobuf/field_mask.proto\x1a\x1cgoogle/protobuf/struct.proto\"\xd7\x38\n\x06Intent\x12\x11\n\x04name\x18\x01 \x01(\tB\x03\xe0\x41\x01\x12\x19\n\x0c\x64isplay_name\x18\x02 \x01(\tB\x03\xe0\x41\x02\x12K\n\rwebhook_state\x18\x06 \x01(\x0e\x32/.google.cloud.dialogflow.v2.Intent.WebhookStateB\x03\xe0\x41\x01\x12\x15\n\x08priority\x18\x03 \x01(\x05\x42\x03\xe0\x41\x01\x12\x18\n\x0bis_fallback\x18\x04 \x01(\x08\x42\x03\xe0\x41\x01\x12\x18\n\x0bml_disabled\x18\x13 \x01(\x08\x42\x03\xe0\x41\x01\x12\x1f\n\x12live_agent_handoff\x18\x14 \x01(\x08\x42\x03\xe0\x41\x01\x12\x1c\n\x0f\x65nd_interaction\x18\x15 \x01(\x08\x42\x03\xe0\x41\x01\x12 \n\x13input_context_names\x18\x07 \x03(\tB\x03\xe0\x41\x01\x12\x13\n\x06\x65vents\x18\x08 \x03(\tB\x03\xe0\x41\x01\x12P\n\x10training_phrases\x18\t \x03(\x0b\x32\x31.google.cloud.dialogflow.v2.Intent.TrainingPhraseB\x03\xe0\x41\x01\x12\x13\n\x06\x61\x63tion\x18\n \x01(\tB\x03\xe0\x41\x01\x12\x41\n\x0foutput_contexts\x18\x0b \x03(\x0b\x32#.google.cloud.dialogflow.v2.ContextB\x03\xe0\x41\x01\x12\x1b\n\x0ereset_contexts\x18\x0c \x01(\x08\x42\x03\xe0\x41\x01\x12\x45\n\nparameters\x18\r \x03(\x0b\x32,.google.cloud.dialogflow.v2.Intent.ParameterB\x03\xe0\x41\x01\x12\x41\n\x08messages\x18\x0e \x03(\x0b\x32*.google.cloud.dialogflow.v2.Intent.MessageB\x03\xe0\x41\x01\x12\\\n\x1a\x64\x65\x66\x61ult_response_platforms\x18\x0f \x03(\x0e\x32\x33.google.cloud.dialogflow.v2.Intent.Message.PlatformB\x03\xe0\x41\x01\x12&\n\x19root_followup_intent_name\x18\x10 \x01(\tB\x03\xe0\x41\x03\x12#\n\x1bparent_followup_intent_name\x18\x11 \x01(\t\x12X\n\x14\x66ollowup_intent_info\x18\x12 \x03(\x0b\x32\x35.google.cloud.dialogflow.v2.Intent.FollowupIntentInfoB\x03\xe0\x41\x03\x1a\xf1\x02\n\x0eTrainingPhrase\x12\x0c\n\x04name\x18\x01 \x01(\t\x12I\n\x04type\x18\x02 \x01(\x0e\x32\x36.google.cloud.dialogflow.v2.Intent.TrainingPhrase.TypeB\x03\xe0\x41\x02\x12J\n\x05parts\x18\x03 \x03(\x0b\x32\x36.google.cloud.dialogflow.v2.Intent.TrainingPhrase.PartB\x03\xe0\x41\x02\x12\x1e\n\x11times_added_count\x18\x04 \x01(\x05\x42\x03\xe0\x41\x01\x1a]\n\x04Part\x12\x0c\n\x04text\x18\x01 \x01(\t\x12\x18\n\x0b\x65ntity_type\x18\x02 \x01(\tB\x03\xe0\x41\x01\x12\x12\n\x05\x61lias\x18\x03 \x01(\tB\x03\xe0\x41\x01\x12\x19\n\x0cuser_defined\x18\x04 \x01(\x08\x42\x03\xe0\x41\x01\";\n\x04Type\x12\x14\n\x10TYPE_UNSPECIFIED\x10\x00\x12\x0b\n\x07\x45XAMPLE\x10\x01\x12\x10\n\x08TEMPLATE\x10\x02\x1a\x02\x08\x01\x1a\xca\x01\n\tParameter\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\x14\n\x0c\x64isplay_name\x18\x02 \x01(\t\x12\x12\n\x05value\x18\x03 \x01(\tB\x03\xe0\x41\x01\x12\x1a\n\rdefault_value\x18\x04 \x01(\tB\x03\xe0\x41\x01\x12%\n\x18\x65ntity_type_display_name\x18\x05 \x01(\tB\x03\xe0\x41\x01\x12\x16\n\tmandatory\x18\x06 \x01(\x08\x42\x03\xe0\x41\x01\x12\x14\n\x07prompts\x18\x07 \x03(\tB\x03\xe0\x41\x01\x12\x14\n\x07is_list\x18\x08 \x01(\x08\x42\x03\xe0\x41\x01\x1a\x96*\n\x07Message\x12?\n\x04text\x18\x01 \x01(\x0b\x32/.google.cloud.dialogflow.v2.Intent.Message.TextH\x00\x12\x41\n\x05image\x18\x02 \x01(\x0b\x32\x30.google.cloud.dialogflow.v2.Intent.Message.ImageH\x00\x12P\n\rquick_replies\x18\x03 \x01(\x0b\x32\x37.google.cloud.dialogflow.v2.Intent.Message.QuickRepliesH\x00\x12?\n\x04\x63\x61rd\x18\x04 \x01(\x0b\x32/.google.cloud.dialogflow.v2.Intent.Message.CardH\x00\x12*\n\x07payload\x18\x05 \x01(\x0b\x32\x17.google.protobuf.StructH\x00\x12V\n\x10simple_responses\x18\x07 \x01(\x0b\x32:.google.cloud.dialogflow.v2.Intent.Message.SimpleResponsesH\x00\x12J\n\nbasic_card\x18\x08 \x01(\x0b\x32\x34.google.cloud.dialogflow.v2.Intent.Message.BasicCardH\x00\x12M\n\x0bsuggestions\x18\t \x01(\x0b\x32\x36.google.cloud.dialogflow.v2.Intent.Message.SuggestionsH\x00\x12[\n\x13link_out_suggestion\x18\n \x01(\x0b\x32<.google.cloud.dialogflow.v2.Intent.Message.LinkOutSuggestionH\x00\x12L\n\x0blist_select\x18\x0b \x01(\x0b\x32\x35.google.cloud.dialogflow.v2.Intent.Message.ListSelectH\x00\x12T\n\x0f\x63\x61rousel_select\x18\x0c \x01(\x0b\x32\x39.google.cloud.dialogflow.v2.Intent.Message.CarouselSelectH\x00\x12]\n\x14\x62rowse_carousel_card\x18\x16 \x01(\x0b\x32=.google.cloud.dialogflow.v2.Intent.Message.BrowseCarouselCardH\x00\x12J\n\ntable_card\x18\x17 \x01(\x0b\x32\x34.google.cloud.dialogflow.v2.Intent.Message.TableCardH\x00\x12P\n\rmedia_content\x18\x18 \x01(\x0b\x32\x37.google.cloud.dialogflow.v2.Intent.Message.MediaContentH\x00\x12J\n\x08platform\x18\x06 \x01(\x0e\x32\x33.google.cloud.dialogflow.v2.Intent.Message.PlatformB\x03\xe0\x41\x01\x1a\x19\n\x04Text\x12\x11\n\x04text\x18\x01 \x03(\tB\x03\xe0\x41\x01\x1a@\n\x05Image\x12\x16\n\timage_uri\x18\x01 \x01(\tB\x03\xe0\x41\x01\x12\x1f\n\x12\x61\x63\x63\x65ssibility_text\x18\x02 \x01(\tB\x03\xe0\x41\x01\x1a>\n\x0cQuickReplies\x12\x12\n\x05title\x18\x01 \x01(\tB\x03\xe0\x41\x01\x12\x1a\n\rquick_replies\x18\x02 \x03(\tB\x03\xe0\x41\x01\x1a\xcb\x01\n\x04\x43\x61rd\x12\x12\n\x05title\x18\x01 \x01(\tB\x03\xe0\x41\x01\x12\x15\n\x08subtitle\x18\x02 \x01(\tB\x03\xe0\x41\x01\x12\x16\n\timage_uri\x18\x03 \x01(\tB\x03\xe0\x41\x01\x12L\n\x07\x62uttons\x18\x04 \x03(\x0b\x32\x36.google.cloud.dialogflow.v2.Intent.Message.Card.ButtonB\x03\xe0\x41\x01\x1a\x32\n\x06\x42utton\x12\x11\n\x04text\x18\x01 \x01(\tB\x03\xe0\x41\x01\x12\x15\n\x08postback\x18\x02 \x01(\tB\x03\xe0\x41\x01\x1aQ\n\x0eSimpleResponse\x12\x16\n\x0etext_to_speech\x18\x01 \x01(\t\x12\x0c\n\x04ssml\x18\x02 \x01(\t\x12\x19\n\x0c\x64isplay_text\x18\x03 \x01(\tB\x03\xe0\x41\x01\x1ak\n\x0fSimpleResponses\x12X\n\x10simple_responses\x18\x01 \x03(\x0b\x32\x39.google.cloud.dialogflow.v2.Intent.Message.SimpleResponseB\x03\xe0\x41\x02\x1a\x88\x03\n\tBasicCard\x12\x12\n\x05title\x18\x01 \x01(\tB\x03\xe0\x41\x01\x12\x15\n\x08subtitle\x18\x02 \x01(\tB\x03\xe0\x41\x01\x12\x16\n\x0e\x66ormatted_text\x18\x03 \x01(\t\x12\x44\n\x05image\x18\x04 \x01(\x0b\x32\x30.google.cloud.dialogflow.v2.Intent.Message.ImageB\x03\xe0\x41\x01\x12Q\n\x07\x62uttons\x18\x05 \x03(\x0b\x32;.google.cloud.dialogflow.v2.Intent.Message.BasicCard.ButtonB\x03\xe0\x41\x01\x1a\x9e\x01\n\x06\x42utton\x12\r\n\x05title\x18\x01 \x01(\t\x12g\n\x0fopen_uri_action\x18\x02 \x01(\x0b\x32I.google.cloud.dialogflow.v2.Intent.Message.BasicCard.Button.OpenUriActionB\x03\xe0\x41\x02\x1a\x1c\n\rOpenUriAction\x12\x0b\n\x03uri\x18\x01 \x01(\t\x1a \n\nSuggestion\x12\x12\n\x05title\x18\x01 \x01(\tB\x03\xe0\x41\x02\x1a^\n\x0bSuggestions\x12O\n\x0bsuggestions\x18\x01 \x03(\x0b\x32\x35.google.cloud.dialogflow.v2.Intent.Message.SuggestionB\x03\xe0\x41\x02\x1a\x44\n\x11LinkOutSuggestion\x12\x1d\n\x10\x64\x65stination_name\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12\x10\n\x03uri\x18\x02 \x01(\tB\x03\xe0\x41\x02\x1a\xd2\x02\n\nListSelect\x12\x12\n\x05title\x18\x01 \x01(\tB\x03\xe0\x41\x01\x12N\n\x05items\x18\x02 \x03(\x0b\x32:.google.cloud.dialogflow.v2.Intent.Message.ListSelect.ItemB\x03\xe0\x41\x02\x12\x15\n\x08subtitle\x18\x03 \x01(\tB\x03\xe0\x41\x01\x1a\xc8\x01\n\x04Item\x12L\n\x04info\x18\x01 \x01(\x0b\x32\x39.google.cloud.dialogflow.v2.Intent.Message.SelectItemInfoB\x03\xe0\x41\x02\x12\x12\n\x05title\x18\x02 \x01(\tB\x03\xe0\x41\x02\x12\x18\n\x0b\x64\x65scription\x18\x03 \x01(\tB\x03\xe0\x41\x01\x12\x44\n\x05image\x18\x04 \x01(\x0b\x32\x30.google.cloud.dialogflow.v2.Intent.Message.ImageB\x03\xe0\x41\x01\x1a\xaf\x02\n\x0e\x43\x61rouselSelect\x12R\n\x05items\x18\x01 \x03(\x0b\x32>.google.cloud.dialogflow.v2.Intent.Message.CarouselSelect.ItemB\x03\xe0\x41\x02\x1a\xc8\x01\n\x04Item\x12L\n\x04info\x18\x01 \x01(\x0b\x32\x39.google.cloud.dialogflow.v2.Intent.Message.SelectItemInfoB\x03\xe0\x41\x02\x12\x12\n\x05title\x18\x02 \x01(\tB\x03\xe0\x41\x02\x12\x18\n\x0b\x64\x65scription\x18\x03 \x01(\tB\x03\xe0\x41\x01\x12\x44\n\x05image\x18\x04 \x01(\x0b\x32\x30.google.cloud.dialogflow.v2.Intent.Message.ImageB\x03\xe0\x41\x01\x1a\x39\n\x0eSelectItemInfo\x12\x10\n\x03key\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12\x15\n\x08synonyms\x18\x02 \x03(\tB\x03\xe0\x41\x01\x1a\x8e\x04\n\x0cMediaContent\x12\x62\n\nmedia_type\x18\x01 \x01(\x0e\x32I.google.cloud.dialogflow.v2.Intent.Message.MediaContent.ResponseMediaTypeB\x03\xe0\x41\x01\x12\x62\n\rmedia_objects\x18\x02 \x03(\x0b\x32K.google.cloud.dialogflow.v2.Intent.Message.MediaContent.ResponseMediaObject\x1a\xf0\x01\n\x13ResponseMediaObject\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\x18\n\x0b\x64\x65scription\x18\x02 \x01(\tB\x03\xe0\x41\x01\x12L\n\x0blarge_image\x18\x03 \x01(\x0b\x32\x30.google.cloud.dialogflow.v2.Intent.Message.ImageB\x03\xe0\x41\x01H\x00\x12\x45\n\x04icon\x18\x04 \x01(\x0b\x32\x30.google.cloud.dialogflow.v2.Intent.Message.ImageB\x03\xe0\x41\x01H\x00\x12\x13\n\x0b\x63ontent_url\x18\x05 \x01(\tB\x07\n\x05image\"C\n\x11ResponseMediaType\x12#\n\x1fRESPONSE_MEDIA_TYPE_UNSPECIFIED\x10\x00\x12\t\n\x05\x41UDIO\x10\x01\x1a\xff\x06\n\x12\x42rowseCarouselCard\x12\x63\n\x05items\x18\x01 \x03(\x0b\x32T.google.cloud.dialogflow.v2.Intent.Message.BrowseCarouselCard.BrowseCarouselCardItem\x12u\n\x15image_display_options\x18\x02 \x01(\x0e\x32Q.google.cloud.dialogflow.v2.Intent.Message.BrowseCarouselCard.ImageDisplayOptionsB\x03\xe0\x41\x01\x1a\x94\x04\n\x16\x42rowseCarouselCardItem\x12{\n\x0fopen_uri_action\x18\x01 \x01(\x0b\x32\x62.google.cloud.dialogflow.v2.Intent.Message.BrowseCarouselCard.BrowseCarouselCardItem.OpenUrlAction\x12\r\n\x05title\x18\x02 \x01(\t\x12\x18\n\x0b\x64\x65scription\x18\x03 \x01(\tB\x03\xe0\x41\x01\x12\x44\n\x05image\x18\x04 \x01(\x0b\x32\x30.google.cloud.dialogflow.v2.Intent.Message.ImageB\x03\xe0\x41\x01\x12\x13\n\x06\x66ooter\x18\x05 \x01(\tB\x03\xe0\x41\x01\x1a\xf8\x01\n\rOpenUrlAction\x12\x0b\n\x03url\x18\x01 \x01(\t\x12\x8a\x01\n\rurl_type_hint\x18\x03 \x01(\x0e\x32n.google.cloud.dialogflow.v2.Intent.Message.BrowseCarouselCard.BrowseCarouselCardItem.OpenUrlAction.UrlTypeHintB\x03\xe0\x41\x01\"M\n\x0bUrlTypeHint\x12\x1d\n\x19URL_TYPE_HINT_UNSPECIFIED\x10\x00\x12\x0e\n\nAMP_ACTION\x10\x01\x12\x0f\n\x0b\x41MP_CONTENT\x10\x02\"v\n\x13ImageDisplayOptions\x12%\n!IMAGE_DISPLAY_OPTIONS_UNSPECIFIED\x10\x00\x12\x08\n\x04GRAY\x10\x01\x12\t\n\x05WHITE\x10\x02\x12\x0b\n\x07\x43ROPPED\x10\x03\x12\x16\n\x12\x42LURRED_BACKGROUND\x10\x04\x1a\xf3\x02\n\tTableCard\x12\r\n\x05title\x18\x01 \x01(\t\x12\x15\n\x08subtitle\x18\x02 \x01(\tB\x03\xe0\x41\x01\x12\x44\n\x05image\x18\x03 \x01(\x0b\x32\x30.google.cloud.dialogflow.v2.Intent.Message.ImageB\x03\xe0\x41\x01\x12[\n\x11\x63olumn_properties\x18\x04 \x03(\x0b\x32;.google.cloud.dialogflow.v2.Intent.Message.ColumnPropertiesB\x03\xe0\x41\x01\x12J\n\x04rows\x18\x05 \x03(\x0b\x32\x37.google.cloud.dialogflow.v2.Intent.Message.TableCardRowB\x03\xe0\x41\x01\x12Q\n\x07\x62uttons\x18\x06 \x03(\x0b\x32;.google.cloud.dialogflow.v2.Intent.Message.BasicCard.ButtonB\x03\xe0\x41\x01\x1a\xfa\x01\n\x10\x43olumnProperties\x12\x0e\n\x06header\x18\x01 \x01(\t\x12r\n\x14horizontal_alignment\x18\x02 \x01(\x0e\x32O.google.cloud.dialogflow.v2.Intent.Message.ColumnProperties.HorizontalAlignmentB\x03\xe0\x41\x01\"b\n\x13HorizontalAlignment\x12$\n HORIZONTAL_ALIGNMENT_UNSPECIFIED\x10\x00\x12\x0b\n\x07LEADING\x10\x01\x12\n\n\x06\x43\x45NTER\x10\x02\x12\x0c\n\x08TRAILING\x10\x03\x1ax\n\x0cTableCardRow\x12L\n\x05\x63\x65lls\x18\x01 \x03(\x0b\x32\x38.google.cloud.dialogflow.v2.Intent.Message.TableCardCellB\x03\xe0\x41\x01\x12\x1a\n\rdivider_after\x18\x02 \x01(\x08\x42\x03\xe0\x41\x01\x1a\x1d\n\rTableCardCell\x12\x0c\n\x04text\x18\x01 \x01(\t\"\xa0\x01\n\x08Platform\x12\x18\n\x14PLATFORM_UNSPECIFIED\x10\x00\x12\x0c\n\x08\x46\x41\x43\x45\x42OOK\x10\x01\x12\t\n\x05SLACK\x10\x02\x12\x0c\n\x08TELEGRAM\x10\x03\x12\x07\n\x03KIK\x10\x04\x12\t\n\x05SKYPE\x10\x05\x12\x08\n\x04LINE\x10\x06\x12\t\n\x05VIBER\x10\x07\x12\x15\n\x11\x41\x43TIONS_ON_GOOGLE\x10\x08\x12\x13\n\x0fGOOGLE_HANGOUTS\x10\x0b\x42\t\n\x07message\x1aW\n\x12\x46ollowupIntentInfo\x12\x1c\n\x14\x66ollowup_intent_name\x18\x01 \x01(\t\x12#\n\x1bparent_followup_intent_name\x18\x02 \x01(\t\"t\n\x0cWebhookState\x12\x1d\n\x19WEBHOOK_STATE_UNSPECIFIED\x10\x00\x12\x19\n\x15WEBHOOK_STATE_ENABLED\x10\x01\x12*\n&WEBHOOK_STATE_ENABLED_FOR_SLOT_FILLING\x10\x02:\x91\x01\xea\x41\x8d\x01\n dialogflow.googleapis.com/Intent\x12)projects/{project}/agent/intents/{intent}\x12>projects/{project}/locations/{location}/agent/intents/{intent}\"\xdd\x01\n\x12ListIntentsRequest\x12\x38\n\x06parent\x18\x01 \x01(\tB(\xe0\x41\x02\xfa\x41\"\x12 dialogflow.googleapis.com/Intent\x12\x1a\n\rlanguage_code\x18\x02 \x01(\tB\x03\xe0\x41\x01\x12@\n\x0bintent_view\x18\x03 \x01(\x0e\x32&.google.cloud.dialogflow.v2.IntentViewB\x03\xe0\x41\x01\x12\x16\n\tpage_size\x18\x04 \x01(\x05\x42\x03\xe0\x41\x01\x12\x17\n\npage_token\x18\x05 \x01(\tB\x03\xe0\x41\x01\"c\n\x13ListIntentsResponse\x12\x33\n\x07intents\x18\x01 \x03(\x0b\x32\".google.cloud.dialogflow.v2.Intent\x12\x17\n\x0fnext_page_token\x18\x02 \x01(\t\"\xa8\x01\n\x10GetIntentRequest\x12\x36\n\x04name\x18\x01 \x01(\tB(\xe0\x41\x02\xfa\x41\"\n dialogflow.googleapis.com/Intent\x12\x1a\n\rlanguage_code\x18\x02 \x01(\tB\x03\xe0\x41\x01\x12@\n\x0bintent_view\x18\x03 \x01(\x0e\x32&.google.cloud.dialogflow.v2.IntentViewB\x03\xe0\x41\x01\"\xe6\x01\n\x13\x43reateIntentRequest\x12\x38\n\x06parent\x18\x01 \x01(\tB(\xe0\x41\x02\xfa\x41\"\x12 dialogflow.googleapis.com/Intent\x12\x37\n\x06intent\x18\x02 \x01(\x0b\x32\".google.cloud.dialogflow.v2.IntentB\x03\xe0\x41\x02\x12\x1a\n\rlanguage_code\x18\x03 \x01(\tB\x03\xe0\x41\x01\x12@\n\x0bintent_view\x18\x04 \x01(\x0e\x32&.google.cloud.dialogflow.v2.IntentViewB\x03\xe0\x41\x01\"\xe2\x01\n\x13UpdateIntentRequest\x12\x37\n\x06intent\x18\x01 \x01(\x0b\x32\".google.cloud.dialogflow.v2.IntentB\x03\xe0\x41\x02\x12\x1a\n\rlanguage_code\x18\x02 \x01(\tB\x03\xe0\x41\x01\x12\x34\n\x0bupdate_mask\x18\x03 \x01(\x0b\x32\x1a.google.protobuf.FieldMaskB\x03\xe0\x41\x01\x12@\n\x0bintent_view\x18\x04 \x01(\x0e\x32&.google.cloud.dialogflow.v2.IntentViewB\x03\xe0\x41\x01\"M\n\x13\x44\x65leteIntentRequest\x12\x36\n\x04name\x18\x01 \x01(\tB(\xe0\x41\x02\xfa\x41\"\n dialogflow.googleapis.com/Intent\"\xdd\x02\n\x19\x42\x61tchUpdateIntentsRequest\x12\x38\n\x06parent\x18\x01 \x01(\tB(\xe0\x41\x02\xfa\x41\"\x12 dialogflow.googleapis.com/Intent\x12\x1a\n\x10intent_batch_uri\x18\x02 \x01(\tH\x00\x12\x46\n\x13intent_batch_inline\x18\x03 \x01(\x0b\x32\'.google.cloud.dialogflow.v2.IntentBatchH\x00\x12\x1a\n\rlanguage_code\x18\x04 \x01(\tB\x03\xe0\x41\x01\x12\x34\n\x0bupdate_mask\x18\x05 \x01(\x0b\x32\x1a.google.protobuf.FieldMaskB\x03\xe0\x41\x01\x12@\n\x0bintent_view\x18\x06 \x01(\x0e\x32&.google.cloud.dialogflow.v2.IntentViewB\x03\xe0\x41\x01\x42\x0e\n\x0cintent_batch\"Q\n\x1a\x42\x61tchUpdateIntentsResponse\x12\x33\n\x07intents\x18\x01 \x03(\x0b\x32\".google.cloud.dialogflow.v2.Intent\"\x8f\x01\n\x19\x42\x61tchDeleteIntentsRequest\x12\x38\n\x06parent\x18\x01 \x01(\tB(\xe0\x41\x02\xfa\x41\"\x12 dialogflow.googleapis.com/Intent\x12\x38\n\x07intents\x18\x02 \x03(\x0b\x32\".google.cloud.dialogflow.v2.IntentB\x03\xe0\x41\x02\"B\n\x0bIntentBatch\x12\x33\n\x07intents\x18\x01 \x03(\x0b\x32\".google.cloud.dialogflow.v2.Intent*?\n\nIntentView\x12\x1b\n\x17INTENT_VIEW_UNSPECIFIED\x10\x00\x12\x14\n\x10INTENT_VIEW_FULL\x10\x01\x32\xf3\x10\n\x07Intents\x12\xf0\x02\n\x0bListIntents\x12..google.cloud.dialogflow.v2.ListIntentsRequest\x1a/.google.cloud.dialogflow.v2.ListIntentsResponse\"\xff\x01\x82\xd3\xe4\x93\x02\xd8\x01\x12%/v2/{parent=projects/*/agent}/intentsZ3\x12\x31/v2/{parent=projects/*/locations/*/agent}/intentsZ6\x12\x34/v2/{parent=projects/*/agent/environments/*}/intentsZB\x12@/v2/{parent=projects/*/locations/*/agent/environments/*}/intents\xda\x41\x06parent\xda\x41\x14parent,language_code\x12\xdd\x01\n\tGetIntent\x12,.google.cloud.dialogflow.v2.GetIntentRequest\x1a\".google.cloud.dialogflow.v2.Intent\"~\x82\xd3\xe4\x93\x02\\\x12%/v2/{name=projects/*/agent/intents/*}Z3\x12\x31/v2/{name=projects/*/locations/*/agent/intents/*}\xda\x41\x04name\xda\x41\x12name,language_code\x12\x86\x02\n\x0c\x43reateIntent\x12/.google.cloud.dialogflow.v2.CreateIntentRequest\x1a\".google.cloud.dialogflow.v2.Intent\"\xa0\x01\x82\xd3\xe4\x93\x02l\"%/v2/{parent=projects/*/agent}/intents:\x06intentZ;\"1/v2/{parent=projects/*/locations/*/agent}/intents:\x06intent\xda\x41\rparent,intent\xda\x41\x1bparent,intent,language_code\x12\xa0\x02\n\x0cUpdateIntent\x12/.google.cloud.dialogflow.v2.UpdateIntentRequest\x1a\".google.cloud.dialogflow.v2.Intent\"\xba\x01\x82\xd3\xe4\x93\x02z2,/v2/{intent.name=projects/*/agent/intents/*}:\x06intentZB28/v2/{intent.name=projects/*/locations/*/agent/intents/*}:\x06intent\xda\x41\x14intent,language_code\xda\x41 intent,language_code,update_mask\x12\xc2\x01\n\x0c\x44\x65leteIntent\x12/.google.cloud.dialogflow.v2.DeleteIntentRequest\x1a\x16.google.protobuf.Empty\"i\x82\xd3\xe4\x93\x02\\*%/v2/{name=projects/*/agent/intents/*}Z3*1/v2/{name=projects/*/locations/*/agent/intents/*}\xda\x41\x04name\x12\xf6\x02\n\x12\x42\x61tchUpdateIntents\x12\x35.google.cloud.dialogflow.v2.BatchUpdateIntentsRequest\x1a\x1d.google.longrunning.Operation\"\x89\x02\x82\xd3\xe4\x93\x02z\"1/v2/{parent=projects/*/agent}/intents:batchUpdate:\x01*ZB\"=/v2/{parent=projects/*/locations/*/agent}/intents:batchUpdate:\x01*\xda\x41\x17parent,intent_batch_uri\xda\x41\x1aparent,intent_batch_inline\xca\x41O\n5google.cloud.dialogflow.v2.BatchUpdateIntentsResponse\x12\x16google.protobuf.Struct\x12\xb0\x02\n\x12\x42\x61tchDeleteIntents\x12\x35.google.cloud.dialogflow.v2.BatchDeleteIntentsRequest\x1a\x1d.google.longrunning.Operation\"\xc3\x01\x82\xd3\xe4\x93\x02z\"1/v2/{parent=projects/*/agent}/intents:batchDelete:\x01*ZB\"=/v2/{parent=projects/*/locations/*/agent}/intents:batchDelete:\x01*\xda\x41\x0eparent,intents\xca\x41/\n\x15google.protobuf.Empty\x12\x16google.protobuf.Struct\x1ax\xca\x41\x19\x64ialogflow.googleapis.com\xd2\x41Yhttps://www.googleapis.com/auth/cloud-platform,https://www.googleapis.com/auth/dialogflowB\x94\x01\n\x1e\x63om.google.cloud.dialogflow.v2B\x0bIntentProtoP\x01Z>cloud.google.com/go/dialogflow/apiv2/dialogflowpb;dialogflowpb\xf8\x01\x01\xa2\x02\x02\x44\x46\xaa\x02\x1aGoogle.Cloud.Dialogflow.V2b\x06proto3"

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
    ["google.cloud.dialogflow.v2.Context", "google/cloud/dialogflow/v2/context.proto"],
    ["google.protobuf.Struct", "google/protobuf/struct.proto"],
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
        Intent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent").msgclass
        Intent::TrainingPhrase = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.TrainingPhrase").msgclass
        Intent::TrainingPhrase::Part = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.TrainingPhrase.Part").msgclass
        Intent::TrainingPhrase::Type = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.TrainingPhrase.Type").enummodule
        Intent::Parameter = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Parameter").msgclass
        Intent::Message = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message").msgclass
        Intent::Message::Text = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.Text").msgclass
        Intent::Message::Image = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.Image").msgclass
        Intent::Message::QuickReplies = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.QuickReplies").msgclass
        Intent::Message::Card = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.Card").msgclass
        Intent::Message::Card::Button = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.Card.Button").msgclass
        Intent::Message::SimpleResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.SimpleResponse").msgclass
        Intent::Message::SimpleResponses = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.SimpleResponses").msgclass
        Intent::Message::BasicCard = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.BasicCard").msgclass
        Intent::Message::BasicCard::Button = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.BasicCard.Button").msgclass
        Intent::Message::BasicCard::Button::OpenUriAction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.BasicCard.Button.OpenUriAction").msgclass
        Intent::Message::Suggestion = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.Suggestion").msgclass
        Intent::Message::Suggestions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.Suggestions").msgclass
        Intent::Message::LinkOutSuggestion = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.LinkOutSuggestion").msgclass
        Intent::Message::ListSelect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.ListSelect").msgclass
        Intent::Message::ListSelect::Item = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.ListSelect.Item").msgclass
        Intent::Message::CarouselSelect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.CarouselSelect").msgclass
        Intent::Message::CarouselSelect::Item = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.CarouselSelect.Item").msgclass
        Intent::Message::SelectItemInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.SelectItemInfo").msgclass
        Intent::Message::MediaContent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.MediaContent").msgclass
        Intent::Message::MediaContent::ResponseMediaObject = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.MediaContent.ResponseMediaObject").msgclass
        Intent::Message::MediaContent::ResponseMediaType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.MediaContent.ResponseMediaType").enummodule
        Intent::Message::BrowseCarouselCard = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.BrowseCarouselCard").msgclass
        Intent::Message::BrowseCarouselCard::BrowseCarouselCardItem = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.BrowseCarouselCard.BrowseCarouselCardItem").msgclass
        Intent::Message::BrowseCarouselCard::BrowseCarouselCardItem::OpenUrlAction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.BrowseCarouselCard.BrowseCarouselCardItem.OpenUrlAction").msgclass
        Intent::Message::BrowseCarouselCard::BrowseCarouselCardItem::OpenUrlAction::UrlTypeHint = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.BrowseCarouselCard.BrowseCarouselCardItem.OpenUrlAction.UrlTypeHint").enummodule
        Intent::Message::BrowseCarouselCard::ImageDisplayOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.BrowseCarouselCard.ImageDisplayOptions").enummodule
        Intent::Message::TableCard = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.TableCard").msgclass
        Intent::Message::ColumnProperties = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.ColumnProperties").msgclass
        Intent::Message::ColumnProperties::HorizontalAlignment = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.ColumnProperties.HorizontalAlignment").enummodule
        Intent::Message::TableCardRow = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.TableCardRow").msgclass
        Intent::Message::TableCardCell = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.TableCardCell").msgclass
        Intent::Message::Platform = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.Message.Platform").enummodule
        Intent::FollowupIntentInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.FollowupIntentInfo").msgclass
        Intent::WebhookState = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.Intent.WebhookState").enummodule
        ListIntentsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.ListIntentsRequest").msgclass
        ListIntentsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.ListIntentsResponse").msgclass
        GetIntentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.GetIntentRequest").msgclass
        CreateIntentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.CreateIntentRequest").msgclass
        UpdateIntentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.UpdateIntentRequest").msgclass
        DeleteIntentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.DeleteIntentRequest").msgclass
        BatchUpdateIntentsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.BatchUpdateIntentsRequest").msgclass
        BatchUpdateIntentsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.BatchUpdateIntentsResponse").msgclass
        BatchDeleteIntentsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.BatchDeleteIntentsRequest").msgclass
        IntentBatch = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.IntentBatch").msgclass
        IntentView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.v2.IntentView").enummodule
      end
    end
  end
end