require 'VRAPI/VRAPI.rb'
require 'soap/mapping'

module VRAPI

module VRAPIMappingRegistry
  EncodedRegistry = ::SOAP::Mapping::EncodedRegistry.new
  LiteralRegistry = ::SOAP::Mapping::LiteralRegistry.new
  NsVRAPIXsd = "http://api.verticalresponse.com/1.0/VRAPI.xsd"

  EncodedRegistry.set(
    VRAPI::ArrayOfCampaignContentLink,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://api.verticalresponse.com/1.0/VRAPI.xsd", "CampaignContentLink") }
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfCompany,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://api.verticalresponse.com/1.0/VRAPI.xsd", "Company") }
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfDomainCount,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://api.verticalresponse.com/1.0/VRAPI.xsd", "DomainCount") }
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfInteger,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://www.w3.org/2001/XMLSchema", "int") }
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfList,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://api.verticalresponse.com/1.0/VRAPI.xsd", "List") }
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfListMember,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://api.verticalresponse.com/1.0/VRAPI.xsd", "ListMember") }
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfNVDictionary,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://api.verticalresponse.com/1.0/VRAPI.xsd", "NVDictionary") }
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfOrderByField,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://api.verticalresponse.com/1.0/VRAPI.xsd", "OrderByField") }
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfRejectedRecordDetail,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://api.verticalresponse.com/1.0/VRAPI.xsd", "RejectedRecordDetail") }
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfString,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://www.w3.org/2001/XMLSchema", "string") }
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfUser,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://api.verticalresponse.com/1.0/VRAPI.xsd", "User") }
  )

  EncodedRegistry.register(
    :class => VRAPI::BackgroundTaskStatus,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "BackgroundTaskStatus"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")]],
      ["start_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "start_date")], [0, 1]],
      ["end_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "end_date")], [0, 1]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "status")]],
      ["percent_complete", ["SOAP::SOAPInt", XSD::QName.new(nil, "percent_complete")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::CampaignContentLink,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "CampaignContentLink"),
    :schema_element => [
      ["position", ["SOAP::SOAPInt", XSD::QName.new(nil, "position")]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "type")]],
      ["redirect_url", ["SOAP::SOAPString", XSD::QName.new(nil, "redirect_url")]],
      ["click_text", ["SOAP::SOAPString", XSD::QName.new(nil, "click_text")]],
      ["hash", ["SOAP::SOAPString", XSD::QName.new(nil, "hash")]],
      ["campaign_item_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_item_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::Company,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "Company"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")], [0, 1]],
      ["address_1", ["SOAP::SOAPString", XSD::QName.new(nil, "address_1")], [0, 1]],
      ["address_2", ["SOAP::SOAPString", XSD::QName.new(nil, "address_2")], [0, 1]],
      ["city", ["SOAP::SOAPString", XSD::QName.new(nil, "city")], [0, 1]],
      ["state", ["SOAP::SOAPString", XSD::QName.new(nil, "state")], [0, 1]],
      ["postalcode", ["SOAP::SOAPString", XSD::QName.new(nil, "postalcode")], [0, 1]],
      ["country", ["SOAP::SOAPString", XSD::QName.new(nil, "country")], [0, 1]],
      ["phone", ["SOAP::SOAPString", XSD::QName.new(nil, "phone")], [0, 1]],
      ["fax", ["SOAP::SOAPString", XSD::QName.new(nil, "fax")], [0, 1]],
      ["url", ["SOAP::SOAPString", XSD::QName.new(nil, "url")], [0, 1]],
      ["creation_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "creation_date")], [0, 1]],
      ["support_email", ["SOAP::SOAPString", XSD::QName.new(nil, "support_email")], [0, 1]],
      ["emails_per_hour", ["SOAP::SOAPInt", XSD::QName.new(nil, "emails_per_hour")], [0, 1]],
      ["logo", ["VRAPI::FileSpec", XSD::QName.new(nil, "logo")], [0, 1]],
      ["users", ["VRAPI::ArrayOfUser", XSD::QName.new(nil, "users")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::DomainCount,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "DomainCount"),
    :schema_element => [
      ["domain", ["SOAP::SOAPString", XSD::QName.new(nil, "domain")]],
      ["count", ["SOAP::SOAPInt", XSD::QName.new(nil, "count")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::EmailCampaign,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "EmailCampaign"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")], [0, 1]],
      ["hash", ["SOAP::SOAPString", XSD::QName.new(nil, "hash")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "type")]],
      ["template_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "template_id")], [0, 1]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "status")], [0, 1]],
      ["display_status", ["SOAP::SOAPString", XSD::QName.new(nil, "display_status")], [0, 1]],
      ["tested", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "tested")], [0, 1]],
      ["declined", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "declined")], [0, 1]],
      ["from_label", ["SOAP::SOAPString", XSD::QName.new(nil, "from_label")], [0, 1]],
      ["support_email", ["SOAP::SOAPString", XSD::QName.new(nil, "support_email")], [0, 1]],
      ["send_friend", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "send_friend")], [0, 1]],
      ["redirect_url", ["SOAP::SOAPString", XSD::QName.new(nil, "redirect_url")], [0, 1]],
      ["sent_size", ["SOAP::SOAPInt", XSD::QName.new(nil, "sent_size")], [0, 1]],
      ["creation_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "creation_date")], [0, 1]],
      ["last_updated", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "last_updated")], [0, 1]],
      ["mail_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "mail_date")], [0, 1]],
      ["contents", ["VRAPI::ArrayOfEmailCampaignContent", XSD::QName.new(nil, "contents")], [0, 1]],
      ["modules", ["VRAPI::ArrayOfTemplateCampaignModule", XSD::QName.new(nil, "modules")], [0, 1]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfEmailCampaign,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "EmailCampaign") }
  )

  EncodedRegistry.register(
    :class => VRAPI::EmailCampaignContent,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "EmailCampaignContent"),
    :schema_element => [
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "type")]],
      ["copy", ["SOAP::SOAPString", XSD::QName.new(nil, "copy")]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfEmailCampaignContent,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "EmailCampaignContent") }
  )

  EncodedRegistry.register(
    :class => VRAPI::EmailCampaignDecline,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "EmailCampaignDecline"),
    :schema_element => [
      ["reason", ["SOAP::SOAPString", XSD::QName.new(nil, "reason")]],
      ["date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "date")]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfEmailCampaignDecline,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "EmailCampaignDecline") }
  )

  EncodedRegistry.register(
    :class => VRAPI::EmailCampaignDomainStats,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "EmailCampaignDomainStats"),
    :schema_element => [
      ["domain_name", ["SOAP::SOAPString", XSD::QName.new(nil, "domain_name")]],
      ["emails_sent", ["SOAP::SOAPInt", XSD::QName.new(nil, "emails_sent")]],
      ["open_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "open_count")]],
      ["reopen_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "reopen_count")]],
      ["click_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "click_count")]],
      ["sale_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "sale_count")]],
      ["purchase_total", ["SOAP::SOAPFloat", XSD::QName.new(nil, "purchase_total")]],
      ["bounce_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "bounce_count")]],
      ["unsub_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "unsub_count")]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfEmailCampaignDomainStats,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "EmailCampaignDomainStats") }
  )

  EncodedRegistry.register(
    :class => VRAPI::EmailCampaignLinkStats,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "EmailCampaignLinkStats"),
    :schema_element => [
      ["click_text", ["SOAP::SOAPInt", XSD::QName.new(nil, "click_text")]],
      ["link_url", ["SOAP::SOAPString", XSD::QName.new(nil, "link_url")]],
      ["link_type", ["SOAP::SOAPString", XSD::QName.new(nil, "link_type")]],
      ["link_hash", ["SOAP::SOAPString", XSD::QName.new(nil, "link_hash")]],
      ["click_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "click_count")]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfEmailCampaignLinkStats,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "EmailCampaignLinkStats") }
  )

  EncodedRegistry.register(
    :class => VRAPI::EmailCampaignResponseHistogram,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "EmailCampaignResponseHistogram"),
    :schema_element => [
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["response_type", ["SOAP::SOAPString", XSD::QName.new(nil, "response_type")]],
      ["response_data", ["VRAPI::Histogram", XSD::QName.new(nil, "response_data")]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfEmailCampaignResponseHistogram,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "EmailCampaignResponseHistogram") }
  )

  EncodedRegistry.register(
    :class => VRAPI::EmailCampaignStats,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "EmailCampaignStats"),
    :schema_element => [
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["campaign_name", ["SOAP::SOAPString", XSD::QName.new(nil, "campaign_name")]],
      ["campaign_type", ["SOAP::SOAPString", XSD::QName.new(nil, "campaign_type")]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "status")]],
      ["sent_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "sent_date")]],
      ["sales_locale", ["SOAP::SOAPString", XSD::QName.new(nil, "sales_locale")], [0, 1]],
      ["email_credit_cost", ["SOAP::SOAPFloat", XSD::QName.new(nil, "email_credit_cost")], [0, 1]],
      ["local_email_credit_cost", ["SOAP::SOAPFloat", XSD::QName.new(nil, "local_email_credit_cost")], [0, 1]],
      ["local_email_credit_currency", ["SOAP::SOAPString", XSD::QName.new(nil, "local_email_credit_currency")], [0, 1]],
      ["additional_costs", ["SOAP::SOAPFloat", XSD::QName.new(nil, "additional_costs")], [0, 1]],
      ["currency_conversion_rate", ["SOAP::SOAPFloat", XSD::QName.new(nil, "currency_conversion_rate")], [0, 1]],
      ["roi", ["SOAP::SOAPFloat", XSD::QName.new(nil, "roi")], [0, 1]],
      ["emails_sent", ["SOAP::SOAPInt", XSD::QName.new(nil, "emails_sent")]],
      ["open_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "open_count")]],
      ["reopen_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "reopen_count")]],
      ["click_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "click_count")]],
      ["sale_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "sale_count")]],
      ["purchase_total", ["SOAP::SOAPFloat", XSD::QName.new(nil, "purchase_total")]],
      ["bounce_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "bounce_count")]],
      ["unsub_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "unsub_count")]],
      ["forward_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "forward_count")], [0, 1]],
      ["link_stats", ["VRAPI::ArrayOfEmailCampaignLinkStats", XSD::QName.new(nil, "link_stats")], [0, 1]],
      ["domain_stats", ["VRAPI::ArrayOfEmailCampaignDomainStats", XSD::QName.new(nil, "domain_stats")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::Event,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "Event"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(nil, "description")], [0, 1]],
      ["start_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "start_date")]],
      ["end_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "end_date")]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfEvent,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "Event") }
  )

  EncodedRegistry.register(
    :class => VRAPI::FileSpec,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "FileSpec"),
    :schema_element => [
      ["filename", ["SOAP::SOAPString", XSD::QName.new(nil, "filename")]],
      ["delimiter", ["SOAP::SOAPString", XSD::QName.new(nil, "delimiter")], [0, 1]],
      ["location", ["SOAP::SOAPString", XSD::QName.new(nil, "location")], [0, 1]],
      ["contents", ["SOAP::SOAPBase64", XSD::QName.new(nil, "contents")], [0, 1]],
      ["media_library_directory", ["SOAP::SOAPString", XSD::QName.new(nil, "media_library_directory")], [0, 1]],
      ["is_directory", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "is_directory")], [0, 1]],
      ["size", ["SOAP::SOAPInt", XSD::QName.new(nil, "size")], [0, 1]],
      ["last_modified", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "last_modified")], [0, 1]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfFileSpec,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "FileSpec") }
  )

  EncodedRegistry.register(
    :class => VRAPI::HistogramBin,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "HistogramBin"),
    :schema_element => [
      ["category", ["SOAP::SOAPString", XSD::QName.new(nil, "category")]],
      ["count", ["SOAP::SOAPInt", XSD::QName.new(nil, "count")]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::Histogram,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "HistogramBin") }
  )

  EncodedRegistry.register(
    :class => VRAPI::List,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "List"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["size", ["SOAP::SOAPInt", XSD::QName.new(nil, "size")]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "type")]],
      ["last_mailed", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "last_mailed")], [0, 1]],
      ["form_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "form_id")], [0, 1]],
      ["creation_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "creation_date")], [0, 1]],
      ["mailable", ["SOAP::SOAPInt", XSD::QName.new(nil, "mailable")], [0, 1]],
      ["mailable_last_updated", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "mailable_last_updated")], [0, 1]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "status")], [0, 1]],
      ["delete_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "delete_date")], [0, 1]],
      ["deleted_by", ["SOAP::SOAPInt", XSD::QName.new(nil, "deleted_by")], [0, 1]],
      ["fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "fields")]],
      ["indexed_fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "indexed_fields")]],
      ["displayed_fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "displayed_fields")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::ListMember,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "ListMember"),
    :schema_element => [
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["list_name", ["SOAP::SOAPString", XSD::QName.new(nil, "list_name")], [0, 1]],
      ["list_type", ["SOAP::SOAPString", XSD::QName.new(nil, "list_type")], [0, 1]],
      ["member_data", ["VRAPI::NVDictionary", XSD::QName.new(nil, "member_data")]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::NVDictionary,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "NVPair") }
  )

  EncodedRegistry.register(
    :class => VRAPI::NVPair,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "NVPair"),
    :schema_element => [
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["value", ["SOAP::SOAPString", XSD::QName.new(nil, "value")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::OptinForm,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "OptinForm"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["company_id", ["SOAP::SOAPString", XSD::QName.new(nil, "company_id")], [0, 1]],
      ["redirect_url", ["SOAP::SOAPString", XSD::QName.new(nil, "redirect_url")], [0, 1]],
      ["logo_name", ["SOAP::SOAPString", XSD::QName.new(nil, "logo_name")], [0, 1]],
      ["confimation_text", ["SOAP::SOAPString", XSD::QName.new(nil, "confimation_text")], [0, 1]],
      ["from_label", ["SOAP::SOAPString", XSD::QName.new(nil, "from_label")], [0, 1]],
      ["confirmation_html", ["SOAP::SOAPString", XSD::QName.new(nil, "confirmation_html")], [0, 1]],
      ["confirmation_subject", ["SOAP::SOAPString", XSD::QName.new(nil, "confirmation_subject")], [0, 1]],
      ["confirmation_from_email", ["SOAP::SOAPString", XSD::QName.new(nil, "confirmation_from_email")], [0, 1]],
      ["confirmation_greeting_text", ["SOAP::SOAPString", XSD::QName.new(nil, "confirmation_greeting_text")], [0, 1]],
      ["confirmation_link_text", ["SOAP::SOAPString", XSD::QName.new(nil, "confirmation_link_text")], [0, 1]],
      ["confirmation_closing_text", ["SOAP::SOAPString", XSD::QName.new(nil, "confirmation_closing_text")], [0, 1]],
      ["notification_frequency", ["SOAP::SOAPInt", XSD::QName.new(nil, "notification_frequency")], [0, 1]],
      ["next_notification", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "next_notification")], [0, 1]],
      ["border_color", ["SOAP::SOAPString", XSD::QName.new(nil, "border_color")], [0, 1]],
      ["background_color", ["SOAP::SOAPString", XSD::QName.new(nil, "background_color")], [0, 1]],
      ["field_text_color", ["SOAP::SOAPString", XSD::QName.new(nil, "field_text_color")], [0, 1]],
      ["title_text", ["SOAP::SOAPString", XSD::QName.new(nil, "title_text")], [0, 1]],
      ["required_text", ["SOAP::SOAPString", XSD::QName.new(nil, "required_text")], [0, 1]],
      ["submit_button_text", ["SOAP::SOAPString", XSD::QName.new(nil, "submit_button_text")], [0, 1]],
      ["confirmation_redirect_url", ["SOAP::SOAPString", XSD::QName.new(nil, "confirmation_redirect_url")], [0, 1]],
      ["list_name", ["SOAP::SOAPString", XSD::QName.new(nil, "list_name")], [0, 1]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")], [0, 1]],
      ["question_collection", ["VRAPI::ArrayOfOptinQuestion", XSD::QName.new(nil, "question_collection")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::OptinQuestion,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "OptinQuestion"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "type")]],
      ["question", ["SOAP::SOAPString", XSD::QName.new(nil, "question")]],
      ["position", ["SOAP::SOAPInt", XSD::QName.new(nil, "position")]],
      ["required", ["SOAP::SOAPInt", XSD::QName.new(nil, "required")]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfOptinQuestion,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "OptinQuestion") }
  )

  EncodedRegistry.register(
    :class => VRAPI::OrderByField,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "OrderByField"),
    :schema_element => [
      ["field_name", ["SOAP::SOAPString", XSD::QName.new(nil, "field_name")]],
      ["direction", ["SOAP::SOAPString", XSD::QName.new(nil, "direction")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::PricingStructureTier,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "PricingStructureTier"),
    :schema_element => [
      ["minimum", ["SOAP::SOAPInt", XSD::QName.new(nil, "minimum")]],
      ["maximum", ["SOAP::SOAPInt", XSD::QName.new(nil, "maximum")]],
      ["unit_price", ["SOAP::SOAPFloat", XSD::QName.new(nil, "unit_price")]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfPricingStructureTier,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "PricingStructureTier") }
  )

  EncodedRegistry.register(
    :class => VRAPI::PurchaseLineItem,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "PurchaseLineItem"),
    :schema_element => [
      ["product_type", ["SOAP::SOAPString", XSD::QName.new(nil, "product_type")]],
      ["product_details", ["SOAP::SOAPString", XSD::QName.new(nil, "product_details")], [0, 1]],
      ["quantity", ["SOAP::SOAPInt", XSD::QName.new(nil, "quantity")]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfPurchaseLineItem,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "PurchaseLineItem") }
  )

  EncodedRegistry.register(
    :class => VRAPI::RejectedRecordDetail,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "RejectedRecordDetail"),
    :schema_element => [
      ["reason_code", ["SOAP::SOAPString", XSD::QName.new(nil, "reason_code")]],
      ["reason", ["SOAP::SOAPString", XSD::QName.new(nil, "reason")]],
      ["num_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "num_records")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::SegmentationQuery,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "SegmentationQuery"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["operation_type", ["SOAP::SOAPString", XSD::QName.new(nil, "operation_type")]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(nil, "description")], [0, 1]],
      ["inputs", ["VRAPI::ArrayOfSegmentationQueryInput", XSD::QName.new(nil, "inputs")], [0, 1]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "status")], [0, 1]],
      ["display_context", ["SOAP::SOAPString", XSD::QName.new(nil, "display_context")], [0, 1]],
      ["deleted_by", ["SOAP::SOAPInt", XSD::QName.new(nil, "deleted_by")], [0, 1]],
      ["delete_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "delete_date")], [0, 1]],
      ["last_run_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "last_run_date")], [0, 1]],
      ["last_run_size", ["SOAP::SOAPInt", XSD::QName.new(nil, "last_run_size")], [0, 1]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfSegmentationQuery,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "SegmentationQuery") }
  )

  EncodedRegistry.register(
    :class => VRAPI::SegmentationQueryInput,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "SegmentationQueryInput"),
    :schema_element => [
      ["input_type", ["SOAP::SOAPString", XSD::QName.new(nil, "input_type")]],
      ["ids", ["VRAPI::ArrayOfInteger", XSD::QName.new(nil, "ids")], [0, 1]],
      ["constraints", ["VRAPI::ArrayOfSegmentationQueryInputConstraint", XSD::QName.new(nil, "constraints")], [0, 1]],
      ["input_constraint_conjunction", ["SOAP::SOAPString", XSD::QName.new(nil, "input_constraint_conjunction")], [0, 1]],
      ["last_run_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "last_run_date")], [0, 1]],
      ["last_run_size", ["SOAP::SOAPInt", XSD::QName.new(nil, "last_run_size")], [0, 1]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfSegmentationQueryInput,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "SegmentationQueryInput") }
  )

  EncodedRegistry.register(
    :class => VRAPI::SegmentationQueryInputConstraint,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "SegmentationQueryInputConstraint"),
    :schema_element => [
      ["constrained_entity", ["SOAP::SOAPString", XSD::QName.new(nil, "constrained_entity")]],
      ["constrained_field", ["SOAP::SOAPString", XSD::QName.new(nil, "constrained_field")]],
      ["constraint_operator", ["SOAP::SOAPString", XSD::QName.new(nil, "constraint_operator")]],
      ["constraint_values", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "constraint_values")], [0, 1]],
      ["constrained_field_start_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "constrained_field_start_date")], [0, 1]],
      ["constrained_field_end_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "constrained_field_end_date")], [0, 1]],
      ["match_if_field_missing", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "match_if_field_missing")]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfSegmentationQueryInputConstraint,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "SegmentationQueryInputConstraint") }
  )

  EncodedRegistry.register(
    :class => VRAPI::SegmentationQueryOutputList,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "SegmentationQueryOutputList"),
    :schema_element => [
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["list_type", ["SOAP::SOAPString", XSD::QName.new(nil, "list_type")]],
      ["num_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "num_records")]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfSegmentationQueryOutputList,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "SegmentationQueryOutputList") }
  )

  EncodedRegistry.register(
    :class => VRAPI::SfMergedFieldRecord,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "SfMergedFieldRecord"),
    :schema_element => [
      ["sf_field", ["SOAP::SOAPString", XSD::QName.new(nil, "sf_field")]],
      ["vr_field", ["SOAP::SOAPString", XSD::QName.new(nil, "vr_field")]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfSfMergedFieldRecords,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "SfMergedFieldRecord") }
  )

  EncodedRegistry.register(
    :class => VRAPI::StreetAddress,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "StreetAddress"),
    :schema_element => [
      ["address_1", ["SOAP::SOAPString", XSD::QName.new(nil, "address_1")]],
      ["address_2", ["SOAP::SOAPString", XSD::QName.new(nil, "address_2")]],
      ["city", ["SOAP::SOAPString", XSD::QName.new(nil, "city")]],
      ["state", ["SOAP::SOAPString", XSD::QName.new(nil, "state")]],
      ["postalcode", ["SOAP::SOAPString", XSD::QName.new(nil, "postalcode")]],
      ["country", ["SOAP::SOAPString", XSD::QName.new(nil, "country")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::Survey,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "Survey"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(nil, "description")]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "status")]],
      ["survey_hash", ["SOAP::SOAPString", XSD::QName.new(nil, "survey_hash")]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfSurvey,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "Survey") }
  )

  EncodedRegistry.register(
    :class => VRAPI::SurveyInvitation,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "SurveyInvitation"),
    :schema_element => [
      ["survey_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "survey_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfSurveyInvitation,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "SurveyInvitation") }
  )

  EncodedRegistry.register(
    :class => VRAPI::TemplateCampaignModule,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "TemplateCampaignModule"),
    :schema_element => [
      ["position", ["SOAP::SOAPInt", XSD::QName.new(nil, "position")]],
      ["template_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "template_id")]],
      ["hash", ["SOAP::SOAPString", XSD::QName.new(nil, "hash")], [0, 1]],
      ["title", ["SOAP::SOAPString", XSD::QName.new(nil, "title")], [0, 1]],
      ["copy", ["SOAP::SOAPString", XSD::QName.new(nil, "copy")], [0, 1]],
      ["redirect_url", ["SOAP::SOAPString", XSD::QName.new(nil, "redirect_url")], [0, 1]],
      ["click_text", ["SOAP::SOAPString", XSD::QName.new(nil, "click_text")], [0, 1]],
      ["images", ["VRAPI::ArrayOfFileSpec", XSD::QName.new(nil, "images")], [0, 1]]
    ]
  )

  EncodedRegistry.set(
    VRAPI::ArrayOfTemplateCampaignModule,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsVRAPIXsd, "TemplateCampaignModule") }
  )

  EncodedRegistry.register(
    :class => VRAPI::User,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "User"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")], [0, 1]],
      ["email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "email_address")]],
      ["company_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "company_id")], [0, 1]],
      ["password", ["SOAP::SOAPString", XSD::QName.new(nil, "password")], [0, 1]],
      ["first_name", ["SOAP::SOAPString", XSD::QName.new(nil, "first_name")], [0, 1]],
      ["last_name", ["SOAP::SOAPString", XSD::QName.new(nil, "last_name")], [0, 1]],
      ["address_1", ["SOAP::SOAPString", XSD::QName.new(nil, "address_1")], [0, 1]],
      ["address_2", ["SOAP::SOAPString", XSD::QName.new(nil, "address_2")], [0, 1]],
      ["city", ["SOAP::SOAPString", XSD::QName.new(nil, "city")], [0, 1]],
      ["state", ["SOAP::SOAPString", XSD::QName.new(nil, "state")], [0, 1]],
      ["postalcode", ["SOAP::SOAPString", XSD::QName.new(nil, "postalcode")], [0, 1]],
      ["country", ["SOAP::SOAPString", XSD::QName.new(nil, "country")], [0, 1]],
      ["timezone", ["SOAP::SOAPString", XSD::QName.new(nil, "timezone")], [0, 1]],
      ["creation_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "creation_date")], [0, 1]],
      ["phone", ["SOAP::SOAPString", XSD::QName.new(nil, "phone")], [0, 1]],
      ["fax", ["SOAP::SOAPString", XSD::QName.new(nil, "fax")], [0, 1]],
      ["url", ["SOAP::SOAPString", XSD::QName.new(nil, "url")], [0, 1]],
      ["last_activity_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "last_activity_date")], [0, 1]],
      ["offer_optin", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "offer_optin")], [0, 1]],
      ["newsletter_optin", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "newsletter_optin")], [0, 1]],
      ["password_question", ["SOAP::SOAPString", XSD::QName.new(nil, "password_question")], [0, 1]],
      ["promotion", ["SOAP::SOAPString", XSD::QName.new(nil, "promotion")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::AddListMemberArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "addListMemberArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_member", ["VRAPI::ListMember", XSD::QName.new(nil, "list_member")]],
      ["validate_postal_address", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "validate_postal_address")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::AppendFileToListArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "appendFileToListArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["file", ["VRAPI::FileSpec", XSD::QName.new(nil, "file")]],
      ["fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "fields")]],
      ["validate_postal_addresses", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "validate_postal_addresses")], [0, 1]],
      ["notification_email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "notification_email_address")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::AppendFileToListResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "appendFileToListResult"),
    :schema_element => [
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["list_name", ["SOAP::SOAPString", XSD::QName.new(nil, "list_name")]],
      ["total_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "total_records")]],
      ["records_loaded", ["SOAP::SOAPInt", XSD::QName.new(nil, "records_loaded")]],
      ["records_rejected", ["SOAP::SOAPInt", XSD::QName.new(nil, "records_rejected")]],
      ["new_list_size", ["SOAP::SOAPInt", XSD::QName.new(nil, "new_list_size")]],
      ["new_mailable_size", ["SOAP::SOAPInt", XSD::QName.new(nil, "new_mailable_size")]],
      ["rejected_records_detail", ["VRAPI::ArrayOfRejectedRecordDetail", XSD::QName.new(nil, "rejected_records_detail")], [0, 1]],
      ["rejected_records_file", ["VRAPI::FileSpec", XSD::QName.new(nil, "rejected_records_file")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::AppendTemplateCampaignModuleArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "appendTemplateCampaignModuleArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["v_module", ["VRAPI::TemplateCampaignModule", XSD::QName.new(nil, "module")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::CalculateCampaignAudienceArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "calculateCampaignAudienceArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::CalculateCampaignAudienceResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "calculateCampaignAudienceResult"),
    :schema_element => [
      ["audience_size", ["SOAP::SOAPInt", XSD::QName.new(nil, "audience_size")]],
      ["total_size", ["SOAP::SOAPInt", XSD::QName.new(nil, "total_size")]],
      ["total_mailable", ["SOAP::SOAPInt", XSD::QName.new(nil, "total_mailable")]],
      ["rejected_records_detail", ["VRAPI::ArrayOfRejectedRecordDetail", XSD::QName.new(nil, "rejected_records_detail")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::CanCallMethodArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "canCallMethodArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["method_name", ["SOAP::SOAPString", XSD::QName.new(nil, "method_name")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::CompileCampaignRecipientResultsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "compileCampaignRecipientResultsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["list_name", ["SOAP::SOAPString", XSD::QName.new(nil, "list_name")]],
      ["fields_to_include", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "fields_to_include")]],
      ["restrict_responses", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "restrict_responses")], [0, 1]],
      ["restrict_lists", ["VRAPI::ArrayOfInteger", XSD::QName.new(nil, "restrict_lists")], [0, 1]],
      ["notification_email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "notification_email_address")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::CompileCampaignRecipientResultsResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "compileCampaignRecipientResultsResult"),
    :schema_element => [
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["num_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "num_records")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::CompileSegmentationQueryArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "compileSegmentationQueryArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["segmentation_query_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "segmentation_query_id")]],
      ["output_lists", ["VRAPI::ArrayOfSegmentationQueryOutputList", XSD::QName.new(nil, "output_lists")], [0, 1]],
      ["notification_email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "notification_email_address")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::CreateEmailCampaignArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "createEmailCampaignArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["email_campaign", ["VRAPI::EmailCampaign", XSD::QName.new(nil, "email_campaign")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::CreateFileArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "createFileArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["file", ["VRAPI::FileSpec", XSD::QName.new(nil, "file")]],
      ["force", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "force")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::CreateListArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "createListArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "type")]],
      ["custom_field_names", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "custom_field_names")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::CreateOptinFormArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "createOptinFormArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["optin_form", ["VRAPI::OptinForm", XSD::QName.new(nil, "optin_form")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::CreateSegmentationQueryArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "createSegmentationQueryArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["segmentation_query", ["VRAPI::SegmentationQuery", XSD::QName.new(nil, "segmentation_query")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::CreateSfListArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "createSfListArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["sf_session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "sf_session_id")]],
      ["sf_endpoint", ["SOAP::SOAPString", XSD::QName.new(nil, "sf_endpoint")]],
      ["list_name", ["SOAP::SOAPString", XSD::QName.new(nil, "list_name")]],
      ["list_type", ["SOAP::SOAPString", XSD::QName.new(nil, "list_type")]],
      ["sfdc_query_id", ["SOAP::SOAPInteger", XSD::QName.new(nil, "sfdc_query_id")]],
      ["lead_soql", ["SOAP::SOAPString", XSD::QName.new(nil, "lead_soql")], [0, 1]],
      ["contact_soql", ["SOAP::SOAPString", XSD::QName.new(nil, "contact_soql")], [0, 1]],
      ["append_to_sfdc_campaign_id", ["SOAP::SOAPString", XSD::QName.new(nil, "append_to_sfdc_campaign_id")], [0, 1]],
      ["validate_postal_addresses", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "validate_postal_addresses")], [0, 1]],
      ["notification_email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "notification_email_address")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::DeleteCampaignArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "deleteCampaignArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::DeleteFileArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "deleteFileArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["file", ["SOAP::SOAPString", XSD::QName.new(nil, "file")]],
      ["move_to_trash", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "move_to_trash")], [0, 1]],
      ["force", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "force")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::DeleteListArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "deleteListArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::DeleteListMemberArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "deleteListMemberArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_member", ["VRAPI::ListMember", XSD::QName.new(nil, "list_member")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::DeleteSegmentationQueryArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "deleteSegmentationQueryArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["segmentation_query_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "segmentation_query_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::DeleteTemplateCampaignModuleArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "deleteTemplateCampaignModuleArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["position", ["SOAP::SOAPInt", XSD::QName.new(nil, "position")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::DownloadCampaignRecipientResultsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "downloadCampaignRecipientResultsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["delimiter", ["SOAP::SOAPString", XSD::QName.new(nil, "delimiter")]],
      ["remove_duplicates", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "remove_duplicates")]],
      ["fields_to_include", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "fields_to_include")]],
      ["restrict_responses", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "restrict_responses")], [0, 1]],
      ["restrict_lists", ["VRAPI::ArrayOfInteger", XSD::QName.new(nil, "restrict_lists")], [0, 1]],
      ["notification_email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "notification_email_address")], [0, 1]],
      ["start_date", ["SOAP::SOAPString", XSD::QName.new(nil, "start_date")], [0, 1]],
      ["end_date", ["SOAP::SOAPString", XSD::QName.new(nil, "end_date")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::DownloadCampaignRecipientResultsResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "downloadCampaignRecipientResultsResult"),
    :schema_element => [
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["num_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "num_records")]],
      ["contents", ["VRAPI::FileSpec", XSD::QName.new(nil, "contents")]],
      ["included_fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "included_fields")]],
      ["restricted_responses", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "restricted_responses")]],
      ["restricted_lists", ["VRAPI::ArrayOfInteger", XSD::QName.new(nil, "restricted_lists")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::DownloadCompanyUnsubscribesAndBouncesArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "downloadCompanyUnsubscribesAndBouncesArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["delimiter", ["SOAP::SOAPString", XSD::QName.new(nil, "delimiter")]],
      ["include_org_linked_unsubs", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_org_linked_unsubs")], [0, 1]],
      ["exclude_campaign_unsubs", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "exclude_campaign_unsubs")], [0, 1]],
      ["start_date", ["SOAP::SOAPString", XSD::QName.new(nil, "start_date")], [0, 1]],
      ["end_date", ["SOAP::SOAPString", XSD::QName.new(nil, "end_date")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::DownloadCompanyUnsubscribesAndBouncesResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "downloadCompanyUnsubscribesAndBouncesResult"),
    :schema_element => [
      ["num_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "num_records")]],
      ["contents", ["VRAPI::FileSpec", XSD::QName.new(nil, "contents")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::DownloadListArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "downloadListArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["delimiter", ["SOAP::SOAPString", XSD::QName.new(nil, "delimiter")]],
      ["fields_to_include", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "fields_to_include")]],
      ["restrict_to", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "restrict_to")], [0, 1]],
      ["notification_email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "notification_email_address")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::DownloadListResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "downloadListResult"),
    :schema_element => [
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["num_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "num_records")]],
      ["contents", ["VRAPI::FileSpec", XSD::QName.new(nil, "contents")]],
      ["delimiter", ["SOAP::SOAPString", XSD::QName.new(nil, "delimiter")]],
      ["included_fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "included_fields")], [0, 1]],
      ["restricted_to", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "restricted_to")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::EditCompanyArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "editCompanyArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["company", ["VRAPI::Company", XSD::QName.new(nil, "company")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::EditListAttributeArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "editListAttributeArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["attribute_name", ["SOAP::SOAPString", XSD::QName.new(nil, "attribute_name")], [0, 1]],
      ["attribute_value", ["SOAP::SOAPString", XSD::QName.new(nil, "attribute_value")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::EditListMemberArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "editListMemberArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_member", ["VRAPI::ListMember", XSD::QName.new(nil, "list_member")]],
      ["validate_postal_address", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "validate_postal_address")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::EditListMembersArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "editListMembersArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_members", ["VRAPI::ArrayOfListMember", XSD::QName.new(nil, "list_members")]],
      ["validate_postal_address", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "validate_postal_address")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::EditSegmentationQueryArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "editSegmentationQueryArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["segmentation_query", ["VRAPI::SegmentationQuery", XSD::QName.new(nil, "segmentation_query")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::EditUserArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "editUserArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["user", ["VRAPI::User", XSD::QName.new(nil, "user")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::EmptyTrashArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "emptyTrashArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::EnumerateEmailCampaignsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "enumerateEmailCampaignsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_ids", ["VRAPI::ArrayOfInteger", XSD::QName.new(nil, "campaign_ids")], [0, 1]],
      ["statuses", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "statuses")], [0, 1]],
      ["include_content", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_content")], [0, 1]],
      ["include_deleted", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_deleted")], [0, 1]],
      ["order_by_fields", ["VRAPI::ArrayOfOrderByField", XSD::QName.new(nil, "order_by_fields")], [0, 1]],
      ["limit", ["SOAP::SOAPInt", XSD::QName.new(nil, "limit")], [0, 1]],
      ["offset", ["SOAP::SOAPInt", XSD::QName.new(nil, "offset")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::EnumerateFilesArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "enumerateFilesArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["base_directory", ["SOAP::SOAPString", XSD::QName.new(nil, "base_directory")], [0, 1]],
      ["recurse_subdirectories", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "recurse_subdirectories")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::EnumerateListsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "enumerateListsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")], [0, 1]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "type")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")], [0, 1]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")], [0, 1]],
      ["form_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "form_id")], [0, 1]],
      ["include_field_info", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_field_info")], [0, 1]],
      ["include_deleted_lists", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_deleted_lists")], [0, 1]],
      ["order_by", ["SOAP::SOAPString", XSD::QName.new(nil, "order_by")], [0, 1]],
      ["limit", ["SOAP::SOAPInt", XSD::QName.new(nil, "limit")], [0, 1]],
      ["offset", ["SOAP::SOAPInt", XSD::QName.new(nil, "offset")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::EnumerateSegmentationQueriesArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "enumerateSegmentationQueriesArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["segmentation_query_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "segmentation_query_id")], [0, 1]],
      ["include_query_detail", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_query_detail")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::EraseListMembersArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "eraseListMembersArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::FetchBackgroundResultArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "fetchBackgroundResultArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["background_task_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "background_task_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetBackgroundTaskStatusArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getBackgroundTaskStatusArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["background_task_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "background_task_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetCampaignDomainCountArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getCampaignDomainCountArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["max_domains", ["SOAP::SOAPInt", XSD::QName.new(nil, "max_domains")], [0, 1]],
      ["restrict_domains", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "restrict_domains")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetCampaignDomainCountResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getCampaignDomainCountResult"),
    :schema_element => [
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["domain_counts", ["VRAPI::ArrayOfDomainCount", XSD::QName.new(nil, "domain_counts")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetCompanyArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getCompanyArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["company_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "company_id")]],
      ["include_users", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_users")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetCompanySummaryArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getCompanySummaryArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["categories", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "categories")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetEmailCampaignDeclineHistoryArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getEmailCampaignDeclineHistoryArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetEmailCampaignResponseHistogramsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getEmailCampaignResponseHistogramsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_ids", ["VRAPI::ArrayOfInteger", XSD::QName.new(nil, "campaign_ids")]],
      ["response_types", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "response_types")]],
      ["bins", ["SOAP::SOAPInt", XSD::QName.new(nil, "bins")]],
      ["min_minutes_since_launch", ["SOAP::SOAPInt", XSD::QName.new(nil, "min_minutes_since_launch")], [0, 1]],
      ["max_minutes_since_launch", ["SOAP::SOAPInt", XSD::QName.new(nil, "max_minutes_since_launch")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetEmailCampaignStatsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getEmailCampaignStatsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["include_link_stats", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_link_stats")], [0, 1]],
      ["include_domain_stats", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_domain_stats")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetEmailCreditBalanceArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getEmailCreditBalanceArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["company_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "company_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetListDomainCountArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getListDomainCountArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["max_domains", ["SOAP::SOAPInt", XSD::QName.new(nil, "max_domains")], [0, 1]],
      ["restrict_domains", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "restrict_domains")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetListDomainCountResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getListDomainCountResult"),
    :schema_element => [
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["domain_counts", ["VRAPI::ArrayOfDomainCount", XSD::QName.new(nil, "domain_counts")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetListMemberByAddressHashArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getListMemberByAddressHashArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["address_hash", ["SOAP::SOAPString", XSD::QName.new(nil, "address_hash")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetListMemberByEmailAddressArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getListMemberByEmailAddressArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "email_address")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetListMemberByHashArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getListMemberByHashArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["hash", ["SOAP::SOAPString", XSD::QName.new(nil, "hash")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetListMembersArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getListMembersArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["max_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "max_records")]],
      ["offset", ["SOAP::SOAPInt", XSD::QName.new(nil, "offset")], [0, 1]],
      ["order_by_fields", ["VRAPI::ArrayOfOrderByField", XSD::QName.new(nil, "order_by_fields")], [0, 1]],
      ["first_order_by_field_start_at", ["SOAP::SOAPString", XSD::QName.new(nil, "first_order_by_field_start_at")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetPricingStructureArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getPricingStructureArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["product_type", ["SOAP::SOAPString", XSD::QName.new(nil, "product_type")]],
      ["product_details", ["SOAP::SOAPString", XSD::QName.new(nil, "product_details")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetPurchaseQuotationArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getPurchaseQuotationArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["product_type", ["SOAP::SOAPString", XSD::QName.new(nil, "product_type")]],
      ["product_details", ["SOAP::SOAPString", XSD::QName.new(nil, "product_details")], [0, 1]],
      ["quantity", ["SOAP::SOAPInt", XSD::QName.new(nil, "quantity")]],
      ["promotion_code", ["SOAP::SOAPString", XSD::QName.new(nil, "promotion_code")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetPurchaseQuotationResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getPurchaseQuotationResult"),
    :schema_element => [
      ["quoted_price", ["SOAP::SOAPFloat", XSD::QName.new(nil, "quoted_price")]],
      ["promotion_code", ["SOAP::SOAPString", XSD::QName.new(nil, "promotion_code")], [0, 1]],
      ["promotion_description", ["SOAP::SOAPString", XSD::QName.new(nil, "promotion_description")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetUserArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getUserArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["user_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "user_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::GetUserByEmailAddressArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getUserByEmailAddressArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "email_address")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::LaunchEmailCampaignArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "launchEmailCampaignArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::LaunchEmailCampaignResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "launchEmailCampaignResult"),
    :schema_element => [
      ["total_size", ["SOAP::SOAPInt", XSD::QName.new(nil, "total_size")]],
      ["total_mailable", ["SOAP::SOAPInt", XSD::QName.new(nil, "total_mailable")]],
      ["merge_fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "merge_fields")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::LoginArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "loginArgs"),
    :schema_element => [
      ["username", ["SOAP::SOAPString", XSD::QName.new(nil, "username")]],
      ["password", ["SOAP::SOAPString", XSD::QName.new(nil, "password")]],
      ["session_duration_minutes", ["SOAP::SOAPInteger", XSD::QName.new(nil, "session_duration_minutes")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::MakeCreditCardPurchaseResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "makeCreditCardPurchaseResult"),
    :schema_element => [
      ["purchase_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "purchase_id")]],
      ["gateway_used", ["SOAP::SOAPString", XSD::QName.new(nil, "gateway_used")], [0, 1]],
      ["decline_message", ["SOAP::SOAPString", XSD::QName.new(nil, "decline_message")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::MoveFileArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "moveFileArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["source", ["SOAP::SOAPString", XSD::QName.new(nil, "source")]],
      ["target", ["SOAP::SOAPString", XSD::QName.new(nil, "target")]],
      ["force", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "force")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::RefreshArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "refreshArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::RenderCampaignContentArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "renderCampaignContentArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")], [0, 1]],
      ["campaign_hash", ["SOAP::SOAPString", XSD::QName.new(nil, "campaign_hash")], [0, 1]],
      ["content_type", ["SOAP::SOAPString", XSD::QName.new(nil, "content_type")], [0, 1]],
      ["view_type", ["SOAP::SOAPString", XSD::QName.new(nil, "view_type")]],
      ["max_text_line_length", ["SOAP::SOAPInt", XSD::QName.new(nil, "max_text_line_length")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::RenderCampaignContentResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "renderCampaignContentResult"),
    :schema_element => [
      ["rendered_content", ["SOAP::SOAPString", XSD::QName.new(nil, "rendered_content")]],
      ["content_links", ["VRAPI::ArrayOfCampaignContentLink", XSD::QName.new(nil, "content_links")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::RunSegmentationQueryArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "runSegmentationQueryArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["segmentation_query_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "segmentation_query_id")]],
      ["notification_email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "notification_email_address")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::SearchListMembersArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "searchListMembersArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["field_name", ["SOAP::SOAPString", XSD::QName.new(nil, "field_name")]],
      ["field_value", ["SOAP::SOAPString", XSD::QName.new(nil, "field_value")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")], [0, 1]],
      ["max_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "max_records")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::SendEmailCampaignTestArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "sendEmailCampaignTestArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["recipients", ["VRAPI::ArrayOfNVDictionary", XSD::QName.new(nil, "recipients")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::SendEmailCampaignTestResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "sendEmailCampaignTestResult"),
    :schema_element => [
      ["text_content_links", ["VRAPI::ArrayOfCampaignContentLink", XSD::QName.new(nil, "text_content_links")]],
      ["html_content_links", ["VRAPI::ArrayOfCampaignContentLink", XSD::QName.new(nil, "html_content_links")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::SetCampaignListsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "setCampaignListsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["list_ids", ["VRAPI::ArrayOfInteger", XSD::QName.new(nil, "list_ids")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::SetCustomListFieldsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "setCustomListFieldsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "fields")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::SetDisplayedListFieldsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "setDisplayedListFieldsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["displayed_fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "displayed_fields")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::SetEmailCampaignAttributeArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "setEmailCampaignAttributeArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["value", ["SOAP::SOAPString", XSD::QName.new(nil, "value")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::SetEmailCampaignContentArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "setEmailCampaignContentArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["content", ["VRAPI::EmailCampaignContent", XSD::QName.new(nil, "content")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::SetIndexedListFieldsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "setIndexedListFieldsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["indexed_fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "indexed_fields")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::SetTemplateCampaignModuleArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "setTemplateCampaignModuleArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["v_module", ["VRAPI::TemplateCampaignModule", XSD::QName.new(nil, "module")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::TransferEmailCreditsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "transferEmailCreditsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["from_company_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "from_company_id")]],
      ["to_company_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "to_company_id")]],
      ["credits_to_transfer", ["SOAP::SOAPInt", XSD::QName.new(nil, "credits_to_transfer")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::UndeleteCampaignArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "undeleteCampaignArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::UndeleteListArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "undeleteListArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::UndeleteSegmentationQueryArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "undeleteSegmentationQueryArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["segmentation_query_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "segmentation_query_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::UnlaunchEmailCampaignArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "unlaunchEmailCampaignArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::ValidateStreetAddressArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "validateStreetAddressArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["street_address", ["VRAPI::StreetAddress", XSD::QName.new(nil, "street_address")]]
    ]
  )

  EncodedRegistry.register(
    :class => VRAPI::ValidateStreetAddressResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "validateStreetAddressResult"),
    :schema_element => [
      ["is_valid_address", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "is_valid_address")]],
      ["corrected_address", ["VRAPI::StreetAddress", XSD::QName.new(nil, "corrected_address")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::BackgroundTaskStatus,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "BackgroundTaskStatus"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")]],
      ["start_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "start_date")], [0, 1]],
      ["end_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "end_date")], [0, 1]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "status")]],
      ["percent_complete", ["SOAP::SOAPInt", XSD::QName.new(nil, "percent_complete")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::CampaignContentLink,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "CampaignContentLink"),
    :schema_element => [
      ["position", ["SOAP::SOAPInt", XSD::QName.new(nil, "position")]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "type")]],
      ["redirect_url", ["SOAP::SOAPString", XSD::QName.new(nil, "redirect_url")]],
      ["click_text", ["SOAP::SOAPString", XSD::QName.new(nil, "click_text")]],
      ["hash", ["SOAP::SOAPString", XSD::QName.new(nil, "hash")]],
      ["campaign_item_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_item_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::Company,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "Company"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")], [0, 1]],
      ["address_1", ["SOAP::SOAPString", XSD::QName.new(nil, "address_1")], [0, 1]],
      ["address_2", ["SOAP::SOAPString", XSD::QName.new(nil, "address_2")], [0, 1]],
      ["city", ["SOAP::SOAPString", XSD::QName.new(nil, "city")], [0, 1]],
      ["state", ["SOAP::SOAPString", XSD::QName.new(nil, "state")], [0, 1]],
      ["postalcode", ["SOAP::SOAPString", XSD::QName.new(nil, "postalcode")], [0, 1]],
      ["country", ["SOAP::SOAPString", XSD::QName.new(nil, "country")], [0, 1]],
      ["phone", ["SOAP::SOAPString", XSD::QName.new(nil, "phone")], [0, 1]],
      ["fax", ["SOAP::SOAPString", XSD::QName.new(nil, "fax")], [0, 1]],
      ["url", ["SOAP::SOAPString", XSD::QName.new(nil, "url")], [0, 1]],
      ["creation_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "creation_date")], [0, 1]],
      ["support_email", ["SOAP::SOAPString", XSD::QName.new(nil, "support_email")], [0, 1]],
      ["emails_per_hour", ["SOAP::SOAPInt", XSD::QName.new(nil, "emails_per_hour")], [0, 1]],
      ["logo", ["VRAPI::FileSpec", XSD::QName.new(nil, "logo")], [0, 1]],
      ["users", ["VRAPI::ArrayOfUser", XSD::QName.new(nil, "users")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::DomainCount,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "DomainCount"),
    :schema_element => [
      ["domain", ["SOAP::SOAPString", XSD::QName.new(nil, "domain")]],
      ["count", ["SOAP::SOAPInt", XSD::QName.new(nil, "count")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EmailCampaign,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "EmailCampaign"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")], [0, 1]],
      ["hash", ["SOAP::SOAPString", XSD::QName.new(nil, "hash")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "type")]],
      ["template_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "template_id")], [0, 1]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "status")], [0, 1]],
      ["display_status", ["SOAP::SOAPString", XSD::QName.new(nil, "display_status")], [0, 1]],
      ["tested", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "tested")], [0, 1]],
      ["declined", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "declined")], [0, 1]],
      ["from_label", ["SOAP::SOAPString", XSD::QName.new(nil, "from_label")], [0, 1]],
      ["support_email", ["SOAP::SOAPString", XSD::QName.new(nil, "support_email")], [0, 1]],
      ["send_friend", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "send_friend")], [0, 1]],
      ["redirect_url", ["SOAP::SOAPString", XSD::QName.new(nil, "redirect_url")], [0, 1]],
      ["sent_size", ["SOAP::SOAPInt", XSD::QName.new(nil, "sent_size")], [0, 1]],
      ["creation_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "creation_date")], [0, 1]],
      ["last_updated", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "last_updated")], [0, 1]],
      ["mail_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "mail_date")], [0, 1]],
      ["contents", ["VRAPI::ArrayOfEmailCampaignContent", XSD::QName.new(nil, "contents")], [0, 1]],
      ["modules", ["VRAPI::ArrayOfTemplateCampaignModule", XSD::QName.new(nil, "modules")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EmailCampaignContent,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "EmailCampaignContent"),
    :schema_element => [
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "type")]],
      ["copy", ["SOAP::SOAPString", XSD::QName.new(nil, "copy")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EmailCampaignDecline,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "EmailCampaignDecline"),
    :schema_element => [
      ["reason", ["SOAP::SOAPString", XSD::QName.new(nil, "reason")]],
      ["date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "date")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EmailCampaignDomainStats,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "EmailCampaignDomainStats"),
    :schema_element => [
      ["domain_name", ["SOAP::SOAPString", XSD::QName.new(nil, "domain_name")]],
      ["emails_sent", ["SOAP::SOAPInt", XSD::QName.new(nil, "emails_sent")]],
      ["open_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "open_count")]],
      ["reopen_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "reopen_count")]],
      ["click_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "click_count")]],
      ["sale_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "sale_count")]],
      ["purchase_total", ["SOAP::SOAPFloat", XSD::QName.new(nil, "purchase_total")]],
      ["bounce_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "bounce_count")]],
      ["unsub_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "unsub_count")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EmailCampaignLinkStats,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "EmailCampaignLinkStats"),
    :schema_element => [
      ["click_text", ["SOAP::SOAPInt", XSD::QName.new(nil, "click_text")]],
      ["link_url", ["SOAP::SOAPString", XSD::QName.new(nil, "link_url")]],
      ["link_type", ["SOAP::SOAPString", XSD::QName.new(nil, "link_type")]],
      ["link_hash", ["SOAP::SOAPString", XSD::QName.new(nil, "link_hash")]],
      ["click_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "click_count")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EmailCampaignResponseHistogram,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "EmailCampaignResponseHistogram"),
    :schema_element => [
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["response_type", ["SOAP::SOAPString", XSD::QName.new(nil, "response_type")]],
      ["response_data", ["VRAPI::Histogram", XSD::QName.new(nil, "response_data")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EmailCampaignStats,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "EmailCampaignStats"),
    :schema_element => [
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["campaign_name", ["SOAP::SOAPString", XSD::QName.new(nil, "campaign_name")]],
      ["campaign_type", ["SOAP::SOAPString", XSD::QName.new(nil, "campaign_type")]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "status")]],
      ["sent_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "sent_date")]],
      ["sales_locale", ["SOAP::SOAPString", XSD::QName.new(nil, "sales_locale")], [0, 1]],
      ["email_credit_cost", ["SOAP::SOAPFloat", XSD::QName.new(nil, "email_credit_cost")], [0, 1]],
      ["local_email_credit_cost", ["SOAP::SOAPFloat", XSD::QName.new(nil, "local_email_credit_cost")], [0, 1]],
      ["local_email_credit_currency", ["SOAP::SOAPString", XSD::QName.new(nil, "local_email_credit_currency")], [0, 1]],
      ["additional_costs", ["SOAP::SOAPFloat", XSD::QName.new(nil, "additional_costs")], [0, 1]],
      ["currency_conversion_rate", ["SOAP::SOAPFloat", XSD::QName.new(nil, "currency_conversion_rate")], [0, 1]],
      ["roi", ["SOAP::SOAPFloat", XSD::QName.new(nil, "roi")], [0, 1]],
      ["emails_sent", ["SOAP::SOAPInt", XSD::QName.new(nil, "emails_sent")]],
      ["open_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "open_count")]],
      ["reopen_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "reopen_count")]],
      ["click_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "click_count")]],
      ["sale_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "sale_count")]],
      ["purchase_total", ["SOAP::SOAPFloat", XSD::QName.new(nil, "purchase_total")]],
      ["bounce_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "bounce_count")]],
      ["unsub_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "unsub_count")]],
      ["forward_count", ["SOAP::SOAPInt", XSD::QName.new(nil, "forward_count")], [0, 1]],
      ["link_stats", ["VRAPI::ArrayOfEmailCampaignLinkStats", XSD::QName.new(nil, "link_stats")], [0, 1]],
      ["domain_stats", ["VRAPI::ArrayOfEmailCampaignDomainStats", XSD::QName.new(nil, "domain_stats")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::Event,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "Event"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(nil, "description")], [0, 1]],
      ["start_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "start_date")]],
      ["end_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "end_date")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::FileSpec,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "FileSpec"),
    :schema_element => [
      ["filename", ["SOAP::SOAPString", XSD::QName.new(nil, "filename")]],
      ["delimiter", ["SOAP::SOAPString", XSD::QName.new(nil, "delimiter")], [0, 1]],
      ["location", ["SOAP::SOAPString", XSD::QName.new(nil, "location")], [0, 1]],
      ["contents", ["SOAP::SOAPBase64", XSD::QName.new(nil, "contents")], [0, 1]],
      ["media_library_directory", ["SOAP::SOAPString", XSD::QName.new(nil, "media_library_directory")], [0, 1]],
      ["is_directory", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "is_directory")], [0, 1]],
      ["size", ["SOAP::SOAPInt", XSD::QName.new(nil, "size")], [0, 1]],
      ["last_modified", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "last_modified")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::HistogramBin,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "HistogramBin"),
    :schema_element => [
      ["category", ["SOAP::SOAPString", XSD::QName.new(nil, "category")]],
      ["count", ["SOAP::SOAPInt", XSD::QName.new(nil, "count")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::List,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "List"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["size", ["SOAP::SOAPInt", XSD::QName.new(nil, "size")]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "type")]],
      ["last_mailed", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "last_mailed")], [0, 1]],
      ["form_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "form_id")], [0, 1]],
      ["creation_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "creation_date")], [0, 1]],
      ["mailable", ["SOAP::SOAPInt", XSD::QName.new(nil, "mailable")], [0, 1]],
      ["mailable_last_updated", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "mailable_last_updated")], [0, 1]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "status")], [0, 1]],
      ["delete_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "delete_date")], [0, 1]],
      ["deleted_by", ["SOAP::SOAPInt", XSD::QName.new(nil, "deleted_by")], [0, 1]],
      ["fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "fields")]],
      ["indexed_fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "indexed_fields")]],
      ["displayed_fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "displayed_fields")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::ListMember,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "ListMember"),
    :schema_element => [
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["list_name", ["SOAP::SOAPString", XSD::QName.new(nil, "list_name")], [0, 1]],
      ["list_type", ["SOAP::SOAPString", XSD::QName.new(nil, "list_type")], [0, 1]],
      ["member_data", ["VRAPI::NVDictionary", XSD::QName.new(nil, "member_data")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::NVPair,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "NVPair"),
    :schema_element => [
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["value", ["SOAP::SOAPString", XSD::QName.new(nil, "value")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::OptinForm,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "OptinForm"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["company_id", ["SOAP::SOAPString", XSD::QName.new(nil, "company_id")], [0, 1]],
      ["redirect_url", ["SOAP::SOAPString", XSD::QName.new(nil, "redirect_url")], [0, 1]],
      ["logo_name", ["SOAP::SOAPString", XSD::QName.new(nil, "logo_name")], [0, 1]],
      ["confimation_text", ["SOAP::SOAPString", XSD::QName.new(nil, "confimation_text")], [0, 1]],
      ["from_label", ["SOAP::SOAPString", XSD::QName.new(nil, "from_label")], [0, 1]],
      ["confirmation_html", ["SOAP::SOAPString", XSD::QName.new(nil, "confirmation_html")], [0, 1]],
      ["confirmation_subject", ["SOAP::SOAPString", XSD::QName.new(nil, "confirmation_subject")], [0, 1]],
      ["confirmation_from_email", ["SOAP::SOAPString", XSD::QName.new(nil, "confirmation_from_email")], [0, 1]],
      ["confirmation_greeting_text", ["SOAP::SOAPString", XSD::QName.new(nil, "confirmation_greeting_text")], [0, 1]],
      ["confirmation_link_text", ["SOAP::SOAPString", XSD::QName.new(nil, "confirmation_link_text")], [0, 1]],
      ["confirmation_closing_text", ["SOAP::SOAPString", XSD::QName.new(nil, "confirmation_closing_text")], [0, 1]],
      ["notification_frequency", ["SOAP::SOAPInt", XSD::QName.new(nil, "notification_frequency")], [0, 1]],
      ["next_notification", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "next_notification")], [0, 1]],
      ["border_color", ["SOAP::SOAPString", XSD::QName.new(nil, "border_color")], [0, 1]],
      ["background_color", ["SOAP::SOAPString", XSD::QName.new(nil, "background_color")], [0, 1]],
      ["field_text_color", ["SOAP::SOAPString", XSD::QName.new(nil, "field_text_color")], [0, 1]],
      ["title_text", ["SOAP::SOAPString", XSD::QName.new(nil, "title_text")], [0, 1]],
      ["required_text", ["SOAP::SOAPString", XSD::QName.new(nil, "required_text")], [0, 1]],
      ["submit_button_text", ["SOAP::SOAPString", XSD::QName.new(nil, "submit_button_text")], [0, 1]],
      ["confirmation_redirect_url", ["SOAP::SOAPString", XSD::QName.new(nil, "confirmation_redirect_url")], [0, 1]],
      ["list_name", ["SOAP::SOAPString", XSD::QName.new(nil, "list_name")], [0, 1]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")], [0, 1]],
      ["question_collection", ["VRAPI::ArrayOfOptinQuestion", XSD::QName.new(nil, "question_collection")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::OptinQuestion,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "OptinQuestion"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "type")]],
      ["question", ["SOAP::SOAPString", XSD::QName.new(nil, "question")]],
      ["position", ["SOAP::SOAPInt", XSD::QName.new(nil, "position")]],
      ["required", ["SOAP::SOAPInt", XSD::QName.new(nil, "required")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::OrderByField,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "OrderByField"),
    :schema_element => [
      ["field_name", ["SOAP::SOAPString", XSD::QName.new(nil, "field_name")]],
      ["direction", ["SOAP::SOAPString", XSD::QName.new(nil, "direction")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::PricingStructureTier,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "PricingStructureTier"),
    :schema_element => [
      ["minimum", ["SOAP::SOAPInt", XSD::QName.new(nil, "minimum")]],
      ["maximum", ["SOAP::SOAPInt", XSD::QName.new(nil, "maximum")]],
      ["unit_price", ["SOAP::SOAPFloat", XSD::QName.new(nil, "unit_price")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::PurchaseLineItem,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "PurchaseLineItem"),
    :schema_element => [
      ["product_type", ["SOAP::SOAPString", XSD::QName.new(nil, "product_type")]],
      ["product_details", ["SOAP::SOAPString", XSD::QName.new(nil, "product_details")], [0, 1]],
      ["quantity", ["SOAP::SOAPInt", XSD::QName.new(nil, "quantity")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::RejectedRecordDetail,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "RejectedRecordDetail"),
    :schema_element => [
      ["reason_code", ["SOAP::SOAPString", XSD::QName.new(nil, "reason_code")]],
      ["reason", ["SOAP::SOAPString", XSD::QName.new(nil, "reason")]],
      ["num_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "num_records")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::SegmentationQuery,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "SegmentationQuery"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["operation_type", ["SOAP::SOAPString", XSD::QName.new(nil, "operation_type")]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(nil, "description")], [0, 1]],
      ["inputs", ["VRAPI::ArrayOfSegmentationQueryInput", XSD::QName.new(nil, "inputs")], [0, 1]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "status")], [0, 1]],
      ["display_context", ["SOAP::SOAPString", XSD::QName.new(nil, "display_context")], [0, 1]],
      ["deleted_by", ["SOAP::SOAPInt", XSD::QName.new(nil, "deleted_by")], [0, 1]],
      ["delete_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "delete_date")], [0, 1]],
      ["last_run_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "last_run_date")], [0, 1]],
      ["last_run_size", ["SOAP::SOAPInt", XSD::QName.new(nil, "last_run_size")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::SegmentationQueryInput,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "SegmentationQueryInput"),
    :schema_element => [
      ["input_type", ["SOAP::SOAPString", XSD::QName.new(nil, "input_type")]],
      ["ids", ["VRAPI::ArrayOfInteger", XSD::QName.new(nil, "ids")], [0, 1]],
      ["constraints", ["VRAPI::ArrayOfSegmentationQueryInputConstraint", XSD::QName.new(nil, "constraints")], [0, 1]],
      ["input_constraint_conjunction", ["SOAP::SOAPString", XSD::QName.new(nil, "input_constraint_conjunction")], [0, 1]],
      ["last_run_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "last_run_date")], [0, 1]],
      ["last_run_size", ["SOAP::SOAPInt", XSD::QName.new(nil, "last_run_size")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::SegmentationQueryInputConstraint,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "SegmentationQueryInputConstraint"),
    :schema_element => [
      ["constrained_entity", ["SOAP::SOAPString", XSD::QName.new(nil, "constrained_entity")]],
      ["constrained_field", ["SOAP::SOAPString", XSD::QName.new(nil, "constrained_field")]],
      ["constraint_operator", ["SOAP::SOAPString", XSD::QName.new(nil, "constraint_operator")]],
      ["constraint_values", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "constraint_values")], [0, 1]],
      ["constrained_field_start_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "constrained_field_start_date")], [0, 1]],
      ["constrained_field_end_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "constrained_field_end_date")], [0, 1]],
      ["match_if_field_missing", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "match_if_field_missing")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::SegmentationQueryOutputList,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "SegmentationQueryOutputList"),
    :schema_element => [
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["list_type", ["SOAP::SOAPString", XSD::QName.new(nil, "list_type")]],
      ["num_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "num_records")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::SfMergedFieldRecord,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "SfMergedFieldRecord"),
    :schema_element => [
      ["sf_field", ["SOAP::SOAPString", XSD::QName.new(nil, "sf_field")]],
      ["vr_field", ["SOAP::SOAPString", XSD::QName.new(nil, "vr_field")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::StreetAddress,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "StreetAddress"),
    :schema_element => [
      ["address_1", ["SOAP::SOAPString", XSD::QName.new(nil, "address_1")]],
      ["address_2", ["SOAP::SOAPString", XSD::QName.new(nil, "address_2")]],
      ["city", ["SOAP::SOAPString", XSD::QName.new(nil, "city")]],
      ["state", ["SOAP::SOAPString", XSD::QName.new(nil, "state")]],
      ["postalcode", ["SOAP::SOAPString", XSD::QName.new(nil, "postalcode")]],
      ["country", ["SOAP::SOAPString", XSD::QName.new(nil, "country")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::Survey,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "Survey"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(nil, "description")]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "status")]],
      ["survey_hash", ["SOAP::SOAPString", XSD::QName.new(nil, "survey_hash")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::SurveyInvitation,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "SurveyInvitation"),
    :schema_element => [
      ["survey_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "survey_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::TemplateCampaignModule,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "TemplateCampaignModule"),
    :schema_element => [
      ["position", ["SOAP::SOAPInt", XSD::QName.new(nil, "position")]],
      ["template_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "template_id")]],
      ["hash", ["SOAP::SOAPString", XSD::QName.new(nil, "hash")], [0, 1]],
      ["title", ["SOAP::SOAPString", XSD::QName.new(nil, "title")], [0, 1]],
      ["copy", ["SOAP::SOAPString", XSD::QName.new(nil, "copy")], [0, 1]],
      ["redirect_url", ["SOAP::SOAPString", XSD::QName.new(nil, "redirect_url")], [0, 1]],
      ["click_text", ["SOAP::SOAPString", XSD::QName.new(nil, "click_text")], [0, 1]],
      ["images", ["VRAPI::ArrayOfFileSpec", XSD::QName.new(nil, "images")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::User,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "User"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")], [0, 1]],
      ["email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "email_address")]],
      ["company_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "company_id")], [0, 1]],
      ["password", ["SOAP::SOAPString", XSD::QName.new(nil, "password")], [0, 1]],
      ["first_name", ["SOAP::SOAPString", XSD::QName.new(nil, "first_name")], [0, 1]],
      ["last_name", ["SOAP::SOAPString", XSD::QName.new(nil, "last_name")], [0, 1]],
      ["address_1", ["SOAP::SOAPString", XSD::QName.new(nil, "address_1")], [0, 1]],
      ["address_2", ["SOAP::SOAPString", XSD::QName.new(nil, "address_2")], [0, 1]],
      ["city", ["SOAP::SOAPString", XSD::QName.new(nil, "city")], [0, 1]],
      ["state", ["SOAP::SOAPString", XSD::QName.new(nil, "state")], [0, 1]],
      ["postalcode", ["SOAP::SOAPString", XSD::QName.new(nil, "postalcode")], [0, 1]],
      ["country", ["SOAP::SOAPString", XSD::QName.new(nil, "country")], [0, 1]],
      ["timezone", ["SOAP::SOAPString", XSD::QName.new(nil, "timezone")], [0, 1]],
      ["creation_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "creation_date")], [0, 1]],
      ["phone", ["SOAP::SOAPString", XSD::QName.new(nil, "phone")], [0, 1]],
      ["fax", ["SOAP::SOAPString", XSD::QName.new(nil, "fax")], [0, 1]],
      ["url", ["SOAP::SOAPString", XSD::QName.new(nil, "url")], [0, 1]],
      ["last_activity_date", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "last_activity_date")], [0, 1]],
      ["offer_optin", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "offer_optin")], [0, 1]],
      ["newsletter_optin", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "newsletter_optin")], [0, 1]],
      ["password_question", ["SOAP::SOAPString", XSD::QName.new(nil, "password_question")], [0, 1]],
      ["promotion", ["SOAP::SOAPString", XSD::QName.new(nil, "promotion")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::AddListMemberArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "addListMemberArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_member", ["VRAPI::ListMember", XSD::QName.new(nil, "list_member")]],
      ["validate_postal_address", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "validate_postal_address")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::AppendFileToListArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "appendFileToListArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["file", ["VRAPI::FileSpec", XSD::QName.new(nil, "file")]],
      ["fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "fields")]],
      ["validate_postal_addresses", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "validate_postal_addresses")], [0, 1]],
      ["notification_email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "notification_email_address")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::AppendFileToListResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "appendFileToListResult"),
    :schema_element => [
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["list_name", ["SOAP::SOAPString", XSD::QName.new(nil, "list_name")]],
      ["total_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "total_records")]],
      ["records_loaded", ["SOAP::SOAPInt", XSD::QName.new(nil, "records_loaded")]],
      ["records_rejected", ["SOAP::SOAPInt", XSD::QName.new(nil, "records_rejected")]],
      ["new_list_size", ["SOAP::SOAPInt", XSD::QName.new(nil, "new_list_size")]],
      ["new_mailable_size", ["SOAP::SOAPInt", XSD::QName.new(nil, "new_mailable_size")]],
      ["rejected_records_detail", ["VRAPI::ArrayOfRejectedRecordDetail", XSD::QName.new(nil, "rejected_records_detail")], [0, 1]],
      ["rejected_records_file", ["VRAPI::FileSpec", XSD::QName.new(nil, "rejected_records_file")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::AppendTemplateCampaignModuleArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "appendTemplateCampaignModuleArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["v_module", ["VRAPI::TemplateCampaignModule", XSD::QName.new(nil, "module")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::CalculateCampaignAudienceArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "calculateCampaignAudienceArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::CalculateCampaignAudienceResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "calculateCampaignAudienceResult"),
    :schema_element => [
      ["audience_size", ["SOAP::SOAPInt", XSD::QName.new(nil, "audience_size")]],
      ["total_size", ["SOAP::SOAPInt", XSD::QName.new(nil, "total_size")]],
      ["total_mailable", ["SOAP::SOAPInt", XSD::QName.new(nil, "total_mailable")]],
      ["rejected_records_detail", ["VRAPI::ArrayOfRejectedRecordDetail", XSD::QName.new(nil, "rejected_records_detail")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::CanCallMethodArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "canCallMethodArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["method_name", ["SOAP::SOAPString", XSD::QName.new(nil, "method_name")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::CompileCampaignRecipientResultsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "compileCampaignRecipientResultsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["list_name", ["SOAP::SOAPString", XSD::QName.new(nil, "list_name")]],
      ["fields_to_include", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "fields_to_include")]],
      ["restrict_responses", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "restrict_responses")], [0, 1]],
      ["restrict_lists", ["VRAPI::ArrayOfInteger", XSD::QName.new(nil, "restrict_lists")], [0, 1]],
      ["notification_email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "notification_email_address")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::CompileCampaignRecipientResultsResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "compileCampaignRecipientResultsResult"),
    :schema_element => [
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["num_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "num_records")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::CompileSegmentationQueryArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "compileSegmentationQueryArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["segmentation_query_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "segmentation_query_id")]],
      ["output_lists", ["VRAPI::ArrayOfSegmentationQueryOutputList", XSD::QName.new(nil, "output_lists")], [0, 1]],
      ["notification_email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "notification_email_address")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::CreateEmailCampaignArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "createEmailCampaignArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["email_campaign", ["VRAPI::EmailCampaign", XSD::QName.new(nil, "email_campaign")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::CreateFileArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "createFileArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["file", ["VRAPI::FileSpec", XSD::QName.new(nil, "file")]],
      ["force", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "force")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::CreateListArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "createListArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "type")]],
      ["custom_field_names", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "custom_field_names")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::CreateOptinFormArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "createOptinFormArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["optin_form", ["VRAPI::OptinForm", XSD::QName.new(nil, "optin_form")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::CreateSegmentationQueryArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "createSegmentationQueryArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["segmentation_query", ["VRAPI::SegmentationQuery", XSD::QName.new(nil, "segmentation_query")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::CreateSfListArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "createSfListArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["sf_session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "sf_session_id")]],
      ["sf_endpoint", ["SOAP::SOAPString", XSD::QName.new(nil, "sf_endpoint")]],
      ["list_name", ["SOAP::SOAPString", XSD::QName.new(nil, "list_name")]],
      ["list_type", ["SOAP::SOAPString", XSD::QName.new(nil, "list_type")]],
      ["sfdc_query_id", ["SOAP::SOAPInteger", XSD::QName.new(nil, "sfdc_query_id")]],
      ["lead_soql", ["SOAP::SOAPString", XSD::QName.new(nil, "lead_soql")], [0, 1]],
      ["contact_soql", ["SOAP::SOAPString", XSD::QName.new(nil, "contact_soql")], [0, 1]],
      ["append_to_sfdc_campaign_id", ["SOAP::SOAPString", XSD::QName.new(nil, "append_to_sfdc_campaign_id")], [0, 1]],
      ["validate_postal_addresses", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "validate_postal_addresses")], [0, 1]],
      ["notification_email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "notification_email_address")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::DeleteCampaignArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "deleteCampaignArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::DeleteFileArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "deleteFileArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["file", ["SOAP::SOAPString", XSD::QName.new(nil, "file")]],
      ["move_to_trash", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "move_to_trash")], [0, 1]],
      ["force", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "force")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::DeleteListArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "deleteListArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::DeleteListMemberArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "deleteListMemberArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_member", ["VRAPI::ListMember", XSD::QName.new(nil, "list_member")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::DeleteSegmentationQueryArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "deleteSegmentationQueryArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["segmentation_query_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "segmentation_query_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::DeleteTemplateCampaignModuleArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "deleteTemplateCampaignModuleArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["position", ["SOAP::SOAPInt", XSD::QName.new(nil, "position")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::DownloadCampaignRecipientResultsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "downloadCampaignRecipientResultsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["delimiter", ["SOAP::SOAPString", XSD::QName.new(nil, "delimiter")]],
      ["remove_duplicates", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "remove_duplicates")]],
      ["fields_to_include", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "fields_to_include")]],
      ["restrict_responses", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "restrict_responses")], [0, 1]],
      ["restrict_lists", ["VRAPI::ArrayOfInteger", XSD::QName.new(nil, "restrict_lists")], [0, 1]],
      ["notification_email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "notification_email_address")], [0, 1]],
      ["start_date", ["SOAP::SOAPString", XSD::QName.new(nil, "start_date")], [0, 1]],
      ["end_date", ["SOAP::SOAPString", XSD::QName.new(nil, "end_date")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::DownloadCampaignRecipientResultsResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "downloadCampaignRecipientResultsResult"),
    :schema_element => [
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["num_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "num_records")]],
      ["contents", ["VRAPI::FileSpec", XSD::QName.new(nil, "contents")]],
      ["included_fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "included_fields")]],
      ["restricted_responses", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "restricted_responses")]],
      ["restricted_lists", ["VRAPI::ArrayOfInteger", XSD::QName.new(nil, "restricted_lists")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::DownloadCompanyUnsubscribesAndBouncesArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "downloadCompanyUnsubscribesAndBouncesArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["delimiter", ["SOAP::SOAPString", XSD::QName.new(nil, "delimiter")]],
      ["include_org_linked_unsubs", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_org_linked_unsubs")], [0, 1]],
      ["exclude_campaign_unsubs", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "exclude_campaign_unsubs")], [0, 1]],
      ["start_date", ["SOAP::SOAPString", XSD::QName.new(nil, "start_date")], [0, 1]],
      ["end_date", ["SOAP::SOAPString", XSD::QName.new(nil, "end_date")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::DownloadCompanyUnsubscribesAndBouncesResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "downloadCompanyUnsubscribesAndBouncesResult"),
    :schema_element => [
      ["num_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "num_records")]],
      ["contents", ["VRAPI::FileSpec", XSD::QName.new(nil, "contents")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::DownloadListArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "downloadListArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["delimiter", ["SOAP::SOAPString", XSD::QName.new(nil, "delimiter")]],
      ["fields_to_include", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "fields_to_include")]],
      ["restrict_to", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "restrict_to")], [0, 1]],
      ["notification_email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "notification_email_address")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::DownloadListResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "downloadListResult"),
    :schema_element => [
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["num_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "num_records")]],
      ["contents", ["VRAPI::FileSpec", XSD::QName.new(nil, "contents")]],
      ["delimiter", ["SOAP::SOAPString", XSD::QName.new(nil, "delimiter")]],
      ["included_fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "included_fields")], [0, 1]],
      ["restricted_to", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "restricted_to")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EditCompanyArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "editCompanyArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["company", ["VRAPI::Company", XSD::QName.new(nil, "company")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EditListAttributeArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "editListAttributeArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["attribute_name", ["SOAP::SOAPString", XSD::QName.new(nil, "attribute_name")], [0, 1]],
      ["attribute_value", ["SOAP::SOAPString", XSD::QName.new(nil, "attribute_value")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EditListMemberArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "editListMemberArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_member", ["VRAPI::ListMember", XSD::QName.new(nil, "list_member")]],
      ["validate_postal_address", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "validate_postal_address")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EditListMembersArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "editListMembersArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_members", ["VRAPI::ArrayOfListMember", XSD::QName.new(nil, "list_members")]],
      ["validate_postal_address", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "validate_postal_address")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EditSegmentationQueryArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "editSegmentationQueryArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["segmentation_query", ["VRAPI::SegmentationQuery", XSD::QName.new(nil, "segmentation_query")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EditUserArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "editUserArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["user", ["VRAPI::User", XSD::QName.new(nil, "user")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EmptyTrashArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "emptyTrashArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EnumerateEmailCampaignsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "enumerateEmailCampaignsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_ids", ["VRAPI::ArrayOfInteger", XSD::QName.new(nil, "campaign_ids")], [0, 1]],
      ["statuses", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "statuses")], [0, 1]],
      ["include_content", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_content")], [0, 1]],
      ["include_deleted", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_deleted")], [0, 1]],
      ["order_by_fields", ["VRAPI::ArrayOfOrderByField", XSD::QName.new(nil, "order_by_fields")], [0, 1]],
      ["limit", ["SOAP::SOAPInt", XSD::QName.new(nil, "limit")], [0, 1]],
      ["offset", ["SOAP::SOAPInt", XSD::QName.new(nil, "offset")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EnumerateFilesArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "enumerateFilesArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["base_directory", ["SOAP::SOAPString", XSD::QName.new(nil, "base_directory")], [0, 1]],
      ["recurse_subdirectories", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "recurse_subdirectories")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EnumerateListsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "enumerateListsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")], [0, 1]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "type")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")], [0, 1]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")], [0, 1]],
      ["form_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "form_id")], [0, 1]],
      ["include_field_info", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_field_info")], [0, 1]],
      ["include_deleted_lists", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_deleted_lists")], [0, 1]],
      ["order_by", ["SOAP::SOAPString", XSD::QName.new(nil, "order_by")], [0, 1]],
      ["limit", ["SOAP::SOAPInt", XSD::QName.new(nil, "limit")], [0, 1]],
      ["offset", ["SOAP::SOAPInt", XSD::QName.new(nil, "offset")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EnumerateSegmentationQueriesArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "enumerateSegmentationQueriesArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["segmentation_query_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "segmentation_query_id")], [0, 1]],
      ["include_query_detail", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_query_detail")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::EraseListMembersArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "eraseListMembersArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::FetchBackgroundResultArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "fetchBackgroundResultArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["background_task_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "background_task_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetBackgroundTaskStatusArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getBackgroundTaskStatusArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["background_task_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "background_task_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetCampaignDomainCountArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getCampaignDomainCountArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["max_domains", ["SOAP::SOAPInt", XSD::QName.new(nil, "max_domains")], [0, 1]],
      ["restrict_domains", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "restrict_domains")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetCampaignDomainCountResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getCampaignDomainCountResult"),
    :schema_element => [
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["domain_counts", ["VRAPI::ArrayOfDomainCount", XSD::QName.new(nil, "domain_counts")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetCompanyArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getCompanyArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["company_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "company_id")]],
      ["include_users", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_users")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetCompanySummaryArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getCompanySummaryArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["categories", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "categories")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetEmailCampaignDeclineHistoryArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getEmailCampaignDeclineHistoryArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetEmailCampaignResponseHistogramsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getEmailCampaignResponseHistogramsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_ids", ["VRAPI::ArrayOfInteger", XSD::QName.new(nil, "campaign_ids")]],
      ["response_types", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "response_types")]],
      ["bins", ["SOAP::SOAPInt", XSD::QName.new(nil, "bins")]],
      ["min_minutes_since_launch", ["SOAP::SOAPInt", XSD::QName.new(nil, "min_minutes_since_launch")], [0, 1]],
      ["max_minutes_since_launch", ["SOAP::SOAPInt", XSD::QName.new(nil, "max_minutes_since_launch")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetEmailCampaignStatsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getEmailCampaignStatsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["include_link_stats", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_link_stats")], [0, 1]],
      ["include_domain_stats", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "include_domain_stats")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetEmailCreditBalanceArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getEmailCreditBalanceArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["company_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "company_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetListDomainCountArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getListDomainCountArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["max_domains", ["SOAP::SOAPInt", XSD::QName.new(nil, "max_domains")], [0, 1]],
      ["restrict_domains", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "restrict_domains")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetListDomainCountResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getListDomainCountResult"),
    :schema_element => [
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["domain_counts", ["VRAPI::ArrayOfDomainCount", XSD::QName.new(nil, "domain_counts")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetListMemberByAddressHashArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getListMemberByAddressHashArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["address_hash", ["SOAP::SOAPString", XSD::QName.new(nil, "address_hash")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetListMemberByEmailAddressArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getListMemberByEmailAddressArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "email_address")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetListMemberByHashArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getListMemberByHashArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["hash", ["SOAP::SOAPString", XSD::QName.new(nil, "hash")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetListMembersArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getListMembersArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["max_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "max_records")]],
      ["offset", ["SOAP::SOAPInt", XSD::QName.new(nil, "offset")], [0, 1]],
      ["order_by_fields", ["VRAPI::ArrayOfOrderByField", XSD::QName.new(nil, "order_by_fields")], [0, 1]],
      ["first_order_by_field_start_at", ["SOAP::SOAPString", XSD::QName.new(nil, "first_order_by_field_start_at")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetPricingStructureArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getPricingStructureArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["product_type", ["SOAP::SOAPString", XSD::QName.new(nil, "product_type")]],
      ["product_details", ["SOAP::SOAPString", XSD::QName.new(nil, "product_details")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetPurchaseQuotationArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getPurchaseQuotationArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["product_type", ["SOAP::SOAPString", XSD::QName.new(nil, "product_type")]],
      ["product_details", ["SOAP::SOAPString", XSD::QName.new(nil, "product_details")], [0, 1]],
      ["quantity", ["SOAP::SOAPInt", XSD::QName.new(nil, "quantity")]],
      ["promotion_code", ["SOAP::SOAPString", XSD::QName.new(nil, "promotion_code")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetPurchaseQuotationResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getPurchaseQuotationResult"),
    :schema_element => [
      ["quoted_price", ["SOAP::SOAPFloat", XSD::QName.new(nil, "quoted_price")]],
      ["promotion_code", ["SOAP::SOAPString", XSD::QName.new(nil, "promotion_code")], [0, 1]],
      ["promotion_description", ["SOAP::SOAPString", XSD::QName.new(nil, "promotion_description")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetUserArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getUserArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["user_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "user_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::GetUserByEmailAddressArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "getUserByEmailAddressArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "email_address")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::LaunchEmailCampaignArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "launchEmailCampaignArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::LaunchEmailCampaignResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "launchEmailCampaignResult"),
    :schema_element => [
      ["total_size", ["SOAP::SOAPInt", XSD::QName.new(nil, "total_size")]],
      ["total_mailable", ["SOAP::SOAPInt", XSD::QName.new(nil, "total_mailable")]],
      ["merge_fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "merge_fields")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::LoginArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "loginArgs"),
    :schema_element => [
      ["username", ["SOAP::SOAPString", XSD::QName.new(nil, "username")]],
      ["password", ["SOAP::SOAPString", XSD::QName.new(nil, "password")]],
      ["session_duration_minutes", ["SOAP::SOAPInteger", XSD::QName.new(nil, "session_duration_minutes")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::MakeCreditCardPurchaseResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "makeCreditCardPurchaseResult"),
    :schema_element => [
      ["purchase_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "purchase_id")]],
      ["gateway_used", ["SOAP::SOAPString", XSD::QName.new(nil, "gateway_used")], [0, 1]],
      ["decline_message", ["SOAP::SOAPString", XSD::QName.new(nil, "decline_message")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::MoveFileArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "moveFileArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["source", ["SOAP::SOAPString", XSD::QName.new(nil, "source")]],
      ["target", ["SOAP::SOAPString", XSD::QName.new(nil, "target")]],
      ["force", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "force")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::RefreshArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "refreshArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::RenderCampaignContentArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "renderCampaignContentArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")], [0, 1]],
      ["campaign_hash", ["SOAP::SOAPString", XSD::QName.new(nil, "campaign_hash")], [0, 1]],
      ["content_type", ["SOAP::SOAPString", XSD::QName.new(nil, "content_type")], [0, 1]],
      ["view_type", ["SOAP::SOAPString", XSD::QName.new(nil, "view_type")]],
      ["max_text_line_length", ["SOAP::SOAPInt", XSD::QName.new(nil, "max_text_line_length")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::RenderCampaignContentResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "renderCampaignContentResult"),
    :schema_element => [
      ["rendered_content", ["SOAP::SOAPString", XSD::QName.new(nil, "rendered_content")]],
      ["content_links", ["VRAPI::ArrayOfCampaignContentLink", XSD::QName.new(nil, "content_links")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::RunSegmentationQueryArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "runSegmentationQueryArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["segmentation_query_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "segmentation_query_id")]],
      ["notification_email_address", ["SOAP::SOAPString", XSD::QName.new(nil, "notification_email_address")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::SearchListMembersArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "searchListMembersArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["field_name", ["SOAP::SOAPString", XSD::QName.new(nil, "field_name")]],
      ["field_value", ["SOAP::SOAPString", XSD::QName.new(nil, "field_value")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")], [0, 1]],
      ["max_records", ["SOAP::SOAPInt", XSD::QName.new(nil, "max_records")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::SendEmailCampaignTestArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "sendEmailCampaignTestArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["recipients", ["VRAPI::ArrayOfNVDictionary", XSD::QName.new(nil, "recipients")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::SendEmailCampaignTestResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "sendEmailCampaignTestResult"),
    :schema_element => [
      ["text_content_links", ["VRAPI::ArrayOfCampaignContentLink", XSD::QName.new(nil, "text_content_links")]],
      ["html_content_links", ["VRAPI::ArrayOfCampaignContentLink", XSD::QName.new(nil, "html_content_links")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::SetCampaignListsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "setCampaignListsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["list_ids", ["VRAPI::ArrayOfInteger", XSD::QName.new(nil, "list_ids")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::SetCustomListFieldsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "setCustomListFieldsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "fields")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::SetDisplayedListFieldsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "setDisplayedListFieldsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["displayed_fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "displayed_fields")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::SetEmailCampaignAttributeArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "setEmailCampaignAttributeArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["value", ["SOAP::SOAPString", XSD::QName.new(nil, "value")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::SetEmailCampaignContentArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "setEmailCampaignContentArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["content", ["VRAPI::EmailCampaignContent", XSD::QName.new(nil, "content")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::SetIndexedListFieldsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "setIndexedListFieldsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]],
      ["indexed_fields", ["VRAPI::ArrayOfString", XSD::QName.new(nil, "indexed_fields")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::SetTemplateCampaignModuleArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "setTemplateCampaignModuleArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]],
      ["v_module", ["VRAPI::TemplateCampaignModule", XSD::QName.new(nil, "module")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::TransferEmailCreditsArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "transferEmailCreditsArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["from_company_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "from_company_id")]],
      ["to_company_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "to_company_id")]],
      ["credits_to_transfer", ["SOAP::SOAPInt", XSD::QName.new(nil, "credits_to_transfer")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::UndeleteCampaignArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "undeleteCampaignArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::UndeleteListArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "undeleteListArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["list_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "list_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::UndeleteSegmentationQueryArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "undeleteSegmentationQueryArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["segmentation_query_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "segmentation_query_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::UnlaunchEmailCampaignArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "unlaunchEmailCampaignArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["campaign_id", ["SOAP::SOAPInt", XSD::QName.new(nil, "campaign_id")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::ValidateStreetAddressArgs,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "validateStreetAddressArgs"),
    :schema_element => [
      ["session_id", ["SOAP::SOAPString", XSD::QName.new(nil, "session_id")]],
      ["street_address", ["VRAPI::StreetAddress", XSD::QName.new(nil, "street_address")]]
    ]
  )

  LiteralRegistry.register(
    :class => VRAPI::ValidateStreetAddressResult,
    :schema_type => XSD::QName.new(NsVRAPIXsd, "validateStreetAddressResult"),
    :schema_element => [
      ["is_valid_address", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "is_valid_address")]],
      ["corrected_address", ["VRAPI::StreetAddress", XSD::QName.new(nil, "corrected_address")], [0, 1]]
    ]
  )
end

end
