require 'xsd/qname'

module VRAPI


# {http://api.verticalresponse.com/1.0/VRAPI.xsd}BackgroundTaskStatus
#   id - SOAP::SOAPInt
#   start_date - SOAP::SOAPDateTime
#   end_date - SOAP::SOAPDateTime
#   status - SOAP::SOAPString
#   percent_complete - SOAP::SOAPInt
class BackgroundTaskStatus
  attr_accessor :id
  attr_accessor :start_date
  attr_accessor :end_date
  attr_accessor :status
  attr_accessor :percent_complete

  def initialize(id = nil, start_date = nil, end_date = nil, status = nil, percent_complete = nil)
    @id = id
    @start_date = start_date
    @end_date = end_date
    @status = status
    @percent_complete = percent_complete
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}CampaignContentLink
#   position - SOAP::SOAPInt
#   type - SOAP::SOAPString
#   redirect_url - SOAP::SOAPString
#   click_text - SOAP::SOAPString
#   hash - SOAP::SOAPString
#   campaign_item_id - SOAP::SOAPInt
class CampaignContentLink
  attr_accessor :position
  attr_accessor :type
  attr_accessor :redirect_url
  attr_accessor :click_text
  attr_accessor :hash
  attr_accessor :campaign_item_id

  def initialize(position = nil, type = nil, redirect_url = nil, click_text = nil, hash = nil, campaign_item_id = nil)
    @position = position
    @type = type
    @redirect_url = redirect_url
    @click_text = click_text
    @hash = hash
    @campaign_item_id = campaign_item_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}Company
#   id - SOAP::SOAPInt
#   name - SOAP::SOAPString
#   address_1 - SOAP::SOAPString
#   address_2 - SOAP::SOAPString
#   city - SOAP::SOAPString
#   state - SOAP::SOAPString
#   postalcode - SOAP::SOAPString
#   country - SOAP::SOAPString
#   phone - SOAP::SOAPString
#   fax - SOAP::SOAPString
#   url - SOAP::SOAPString
#   creation_date - SOAP::SOAPDateTime
#   support_email - SOAP::SOAPString
#   emails_per_hour - SOAP::SOAPInt
#   logo - VRAPI::FileSpec
#   users - VRAPI::ArrayOfUser
class Company
  attr_accessor :id
  attr_accessor :name
  attr_accessor :address_1
  attr_accessor :address_2
  attr_accessor :city
  attr_accessor :state
  attr_accessor :postalcode
  attr_accessor :country
  attr_accessor :phone
  attr_accessor :fax
  attr_accessor :url
  attr_accessor :creation_date
  attr_accessor :support_email
  attr_accessor :emails_per_hour
  attr_accessor :logo
  attr_accessor :users

  def initialize(id = nil, name = nil, address_1 = nil, address_2 = nil, city = nil, state = nil, postalcode = nil, country = nil, phone = nil, fax = nil, url = nil, creation_date = nil, support_email = nil, emails_per_hour = nil, logo = nil, users = nil)
    @id = id
    @name = name
    @address_1 = address_1
    @address_2 = address_2
    @city = city
    @state = state
    @postalcode = postalcode
    @country = country
    @phone = phone
    @fax = fax
    @url = url
    @creation_date = creation_date
    @support_email = support_email
    @emails_per_hour = emails_per_hour
    @logo = logo
    @users = users
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}DomainCount
#   domain - SOAP::SOAPString
#   count - SOAP::SOAPInt
class DomainCount
  attr_accessor :domain
  attr_accessor :count

  def initialize(domain = nil, count = nil)
    @domain = domain
    @count = count
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}EmailCampaign
#   id - SOAP::SOAPInt
#   hash - SOAP::SOAPString
#   name - SOAP::SOAPString
#   type - SOAP::SOAPString
#   template_id - SOAP::SOAPInt
#   status - SOAP::SOAPString
#   display_status - SOAP::SOAPString
#   tested - SOAP::SOAPBoolean
#   declined - SOAP::SOAPBoolean
#   from_label - SOAP::SOAPString
#   support_email - SOAP::SOAPString
#   send_friend - SOAP::SOAPBoolean
#   redirect_url - SOAP::SOAPString
#   sent_size - SOAP::SOAPInt
#   creation_date - SOAP::SOAPDateTime
#   last_updated - SOAP::SOAPDateTime
#   mail_date - SOAP::SOAPDateTime
#   contents - VRAPI::ArrayOfEmailCampaignContent
#   modules - VRAPI::ArrayOfTemplateCampaignModule
class EmailCampaign
  attr_accessor :id
  attr_accessor :hash
  attr_accessor :name
  attr_accessor :type
  attr_accessor :template_id
  attr_accessor :status
  attr_accessor :display_status
  attr_accessor :tested
  attr_accessor :declined
  attr_accessor :from_label
  attr_accessor :support_email
  attr_accessor :send_friend
  attr_accessor :redirect_url
  attr_accessor :sent_size
  attr_accessor :creation_date
  attr_accessor :last_updated
  attr_accessor :mail_date
  attr_accessor :contents
  attr_accessor :modules

  def initialize(id = nil, hash = nil, name = nil, type = nil, template_id = nil, status = nil, display_status = nil, tested = nil, declined = nil, from_label = nil, support_email = nil, send_friend = nil, redirect_url = nil, sent_size = nil, creation_date = nil, last_updated = nil, mail_date = nil, contents = nil, modules = nil)
    @id = id
    @hash = hash
    @name = name
    @type = type
    @template_id = template_id
    @status = status
    @display_status = display_status
    @tested = tested
    @declined = declined
    @from_label = from_label
    @support_email = support_email
    @send_friend = send_friend
    @redirect_url = redirect_url
    @sent_size = sent_size
    @creation_date = creation_date
    @last_updated = last_updated
    @mail_date = mail_date
    @contents = contents
    @modules = modules
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}EmailCampaignContent
#   type - SOAP::SOAPString
#   copy - SOAP::SOAPString
class EmailCampaignContent
  attr_accessor :type
  attr_accessor :copy

  def initialize(type = nil, copy = nil)
    @type = type
    @copy = copy
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}EmailCampaignDecline
#   reason - SOAP::SOAPString
#   date - SOAP::SOAPDateTime
class EmailCampaignDecline
  attr_accessor :reason
  attr_accessor :date

  def initialize(reason = nil, date = nil)
    @reason = reason
    @date = date
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}EmailCampaignDomainStats
#   domain_name - SOAP::SOAPString
#   emails_sent - SOAP::SOAPInt
#   open_count - SOAP::SOAPInt
#   reopen_count - SOAP::SOAPInt
#   click_count - SOAP::SOAPInt
#   sale_count - SOAP::SOAPInt
#   purchase_total - SOAP::SOAPFloat
#   bounce_count - SOAP::SOAPInt
#   unsub_count - SOAP::SOAPInt
class EmailCampaignDomainStats
  attr_accessor :domain_name
  attr_accessor :emails_sent
  attr_accessor :open_count
  attr_accessor :reopen_count
  attr_accessor :click_count
  attr_accessor :sale_count
  attr_accessor :purchase_total
  attr_accessor :bounce_count
  attr_accessor :unsub_count

  def initialize(domain_name = nil, emails_sent = nil, open_count = nil, reopen_count = nil, click_count = nil, sale_count = nil, purchase_total = nil, bounce_count = nil, unsub_count = nil)
    @domain_name = domain_name
    @emails_sent = emails_sent
    @open_count = open_count
    @reopen_count = reopen_count
    @click_count = click_count
    @sale_count = sale_count
    @purchase_total = purchase_total
    @bounce_count = bounce_count
    @unsub_count = unsub_count
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}EmailCampaignLinkStats
#   click_text - SOAP::SOAPInt
#   link_url - SOAP::SOAPString
#   link_type - SOAP::SOAPString
#   link_hash - SOAP::SOAPString
#   click_count - SOAP::SOAPInt
class EmailCampaignLinkStats
  attr_accessor :click_text
  attr_accessor :link_url
  attr_accessor :link_type
  attr_accessor :link_hash
  attr_accessor :click_count

  def initialize(click_text = nil, link_url = nil, link_type = nil, link_hash = nil, click_count = nil)
    @click_text = click_text
    @link_url = link_url
    @link_type = link_type
    @link_hash = link_hash
    @click_count = click_count
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}EmailCampaignResponseHistogram
#   campaign_id - SOAP::SOAPInt
#   response_type - SOAP::SOAPString
#   response_data - VRAPI::Histogram
class EmailCampaignResponseHistogram
  attr_accessor :campaign_id
  attr_accessor :response_type
  attr_accessor :response_data

  def initialize(campaign_id = nil, response_type = nil, response_data = nil)
    @campaign_id = campaign_id
    @response_type = response_type
    @response_data = response_data
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}EmailCampaignStats
#   campaign_id - SOAP::SOAPInt
#   campaign_name - SOAP::SOAPString
#   campaign_type - SOAP::SOAPString
#   status - SOAP::SOAPString
#   sent_date - SOAP::SOAPDateTime
#   sales_locale - SOAP::SOAPString
#   email_credit_cost - SOAP::SOAPFloat
#   local_email_credit_cost - SOAP::SOAPFloat
#   local_email_credit_currency - SOAP::SOAPString
#   additional_costs - SOAP::SOAPFloat
#   currency_conversion_rate - SOAP::SOAPFloat
#   roi - SOAP::SOAPFloat
#   emails_sent - SOAP::SOAPInt
#   open_count - SOAP::SOAPInt
#   reopen_count - SOAP::SOAPInt
#   click_count - SOAP::SOAPInt
#   sale_count - SOAP::SOAPInt
#   purchase_total - SOAP::SOAPFloat
#   bounce_count - SOAP::SOAPInt
#   unsub_count - SOAP::SOAPInt
#   forward_count - SOAP::SOAPInt
#   link_stats - VRAPI::ArrayOfEmailCampaignLinkStats
#   domain_stats - VRAPI::ArrayOfEmailCampaignDomainStats
class EmailCampaignStats
  attr_accessor :campaign_id
  attr_accessor :campaign_name
  attr_accessor :campaign_type
  attr_accessor :status
  attr_accessor :sent_date
  attr_accessor :sales_locale
  attr_accessor :email_credit_cost
  attr_accessor :local_email_credit_cost
  attr_accessor :local_email_credit_currency
  attr_accessor :additional_costs
  attr_accessor :currency_conversion_rate
  attr_accessor :roi
  attr_accessor :emails_sent
  attr_accessor :open_count
  attr_accessor :reopen_count
  attr_accessor :click_count
  attr_accessor :sale_count
  attr_accessor :purchase_total
  attr_accessor :bounce_count
  attr_accessor :unsub_count
  attr_accessor :forward_count
  attr_accessor :link_stats
  attr_accessor :domain_stats

  def initialize(campaign_id = nil, campaign_name = nil, campaign_type = nil, status = nil, sent_date = nil, sales_locale = nil, email_credit_cost = nil, local_email_credit_cost = nil, local_email_credit_currency = nil, additional_costs = nil, currency_conversion_rate = nil, roi = nil, emails_sent = nil, open_count = nil, reopen_count = nil, click_count = nil, sale_count = nil, purchase_total = nil, bounce_count = nil, unsub_count = nil, forward_count = nil, link_stats = nil, domain_stats = nil)
    @campaign_id = campaign_id
    @campaign_name = campaign_name
    @campaign_type = campaign_type
    @status = status
    @sent_date = sent_date
    @sales_locale = sales_locale
    @email_credit_cost = email_credit_cost
    @local_email_credit_cost = local_email_credit_cost
    @local_email_credit_currency = local_email_credit_currency
    @additional_costs = additional_costs
    @currency_conversion_rate = currency_conversion_rate
    @roi = roi
    @emails_sent = emails_sent
    @open_count = open_count
    @reopen_count = reopen_count
    @click_count = click_count
    @sale_count = sale_count
    @purchase_total = purchase_total
    @bounce_count = bounce_count
    @unsub_count = unsub_count
    @forward_count = forward_count
    @link_stats = link_stats
    @domain_stats = domain_stats
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}Event
#   id - SOAP::SOAPInt
#   name - SOAP::SOAPString
#   description - SOAP::SOAPString
#   start_date - SOAP::SOAPDateTime
#   end_date - SOAP::SOAPDateTime
class Event
  attr_accessor :id
  attr_accessor :name
  attr_accessor :description
  attr_accessor :start_date
  attr_accessor :end_date

  def initialize(id = nil, name = nil, description = nil, start_date = nil, end_date = nil)
    @id = id
    @name = name
    @description = description
    @start_date = start_date
    @end_date = end_date
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}FileSpec
#   filename - SOAP::SOAPString
#   delimiter - SOAP::SOAPString
#   location - SOAP::SOAPString
#   contents - SOAP::SOAPBase64
#   media_library_directory - SOAP::SOAPString
#   is_directory - SOAP::SOAPBoolean
#   size - SOAP::SOAPInt
#   last_modified - SOAP::SOAPDateTime
class FileSpec
  attr_accessor :filename
  attr_accessor :delimiter
  attr_accessor :location
  attr_accessor :contents
  attr_accessor :media_library_directory
  attr_accessor :is_directory
  attr_accessor :size
  attr_accessor :last_modified

  def initialize(filename = nil, delimiter = nil, location = nil, contents = nil, media_library_directory = nil, is_directory = nil, size = nil, last_modified = nil)
    @filename = filename
    @delimiter = delimiter
    @location = location
    @contents = contents
    @media_library_directory = media_library_directory
    @is_directory = is_directory
    @size = size
    @last_modified = last_modified
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}HistogramBin
#   category - SOAP::SOAPString
#   count - SOAP::SOAPInt
class HistogramBin
  attr_accessor :category
  attr_accessor :count

  def initialize(category = nil, count = nil)
    @category = category
    @count = count
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}List
#   id - SOAP::SOAPInt
#   name - SOAP::SOAPString
#   size - SOAP::SOAPInt
#   type - SOAP::SOAPString
#   last_mailed - SOAP::SOAPDateTime
#   form_id - SOAP::SOAPInt
#   creation_date - SOAP::SOAPDateTime
#   mailable - SOAP::SOAPInt
#   mailable_last_updated - SOAP::SOAPDateTime
#   status - SOAP::SOAPString
#   delete_date - SOAP::SOAPDateTime
#   deleted_by - SOAP::SOAPInt
#   fields - VRAPI::ArrayOfString
#   indexed_fields - VRAPI::ArrayOfString
#   displayed_fields - VRAPI::ArrayOfString
class List
  attr_accessor :id
  attr_accessor :name
  attr_accessor :size
  attr_accessor :type
  attr_accessor :last_mailed
  attr_accessor :form_id
  attr_accessor :creation_date
  attr_accessor :mailable
  attr_accessor :mailable_last_updated
  attr_accessor :status
  attr_accessor :delete_date
  attr_accessor :deleted_by
  attr_accessor :fields
  attr_accessor :indexed_fields
  attr_accessor :displayed_fields

  def initialize(id = nil, name = nil, size = nil, type = nil, last_mailed = nil, form_id = nil, creation_date = nil, mailable = nil, mailable_last_updated = nil, status = nil, delete_date = nil, deleted_by = nil, fields = nil, indexed_fields = nil, displayed_fields = nil)
    @id = id
    @name = name
    @size = size
    @type = type
    @last_mailed = last_mailed
    @form_id = form_id
    @creation_date = creation_date
    @mailable = mailable
    @mailable_last_updated = mailable_last_updated
    @status = status
    @delete_date = delete_date
    @deleted_by = deleted_by
    @fields = fields
    @indexed_fields = indexed_fields
    @displayed_fields = displayed_fields
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ListMember
#   list_id - SOAP::SOAPInt
#   list_name - SOAP::SOAPString
#   list_type - SOAP::SOAPString
#   member_data - VRAPI::NVDictionary
class ListMember
  attr_accessor :list_id
  attr_accessor :list_name
  attr_accessor :list_type
  attr_accessor :member_data

  def initialize(list_id = nil, list_name = nil, list_type = nil, member_data = nil)
    @list_id = list_id
    @list_name = list_name
    @list_type = list_type
    @member_data = member_data
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}NVPair
#   name - SOAP::SOAPString
#   value - SOAP::SOAPString
class NVPair
  attr_accessor :name
  attr_accessor :value

  def initialize(name = nil, value = nil)
    @name = name
    @value = value
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}OptinForm
#   id - SOAP::SOAPInt
#   name - SOAP::SOAPString
#   company_id - SOAP::SOAPString
#   redirect_url - SOAP::SOAPString
#   logo_name - SOAP::SOAPString
#   confimation_text - SOAP::SOAPString
#   from_label - SOAP::SOAPString
#   confirmation_html - SOAP::SOAPString
#   confirmation_subject - SOAP::SOAPString
#   confirmation_from_email - SOAP::SOAPString
#   confirmation_greeting_text - SOAP::SOAPString
#   confirmation_link_text - SOAP::SOAPString
#   confirmation_closing_text - SOAP::SOAPString
#   notification_frequency - SOAP::SOAPInt
#   next_notification - SOAP::SOAPDateTime
#   border_color - SOAP::SOAPString
#   background_color - SOAP::SOAPString
#   field_text_color - SOAP::SOAPString
#   title_text - SOAP::SOAPString
#   required_text - SOAP::SOAPString
#   submit_button_text - SOAP::SOAPString
#   confirmation_redirect_url - SOAP::SOAPString
#   list_name - SOAP::SOAPString
#   list_id - SOAP::SOAPInt
#   question_collection - VRAPI::ArrayOfOptinQuestion
class OptinForm
  attr_accessor :id
  attr_accessor :name
  attr_accessor :company_id
  attr_accessor :redirect_url
  attr_accessor :logo_name
  attr_accessor :confimation_text
  attr_accessor :from_label
  attr_accessor :confirmation_html
  attr_accessor :confirmation_subject
  attr_accessor :confirmation_from_email
  attr_accessor :confirmation_greeting_text
  attr_accessor :confirmation_link_text
  attr_accessor :confirmation_closing_text
  attr_accessor :notification_frequency
  attr_accessor :next_notification
  attr_accessor :border_color
  attr_accessor :background_color
  attr_accessor :field_text_color
  attr_accessor :title_text
  attr_accessor :required_text
  attr_accessor :submit_button_text
  attr_accessor :confirmation_redirect_url
  attr_accessor :list_name
  attr_accessor :list_id
  attr_accessor :question_collection

  def initialize(id = nil, name = nil, company_id = nil, redirect_url = nil, logo_name = nil, confimation_text = nil, from_label = nil, confirmation_html = nil, confirmation_subject = nil, confirmation_from_email = nil, confirmation_greeting_text = nil, confirmation_link_text = nil, confirmation_closing_text = nil, notification_frequency = nil, next_notification = nil, border_color = nil, background_color = nil, field_text_color = nil, title_text = nil, required_text = nil, submit_button_text = nil, confirmation_redirect_url = nil, list_name = nil, list_id = nil, question_collection = nil)
    @id = id
    @name = name
    @company_id = company_id
    @redirect_url = redirect_url
    @logo_name = logo_name
    @confimation_text = confimation_text
    @from_label = from_label
    @confirmation_html = confirmation_html
    @confirmation_subject = confirmation_subject
    @confirmation_from_email = confirmation_from_email
    @confirmation_greeting_text = confirmation_greeting_text
    @confirmation_link_text = confirmation_link_text
    @confirmation_closing_text = confirmation_closing_text
    @notification_frequency = notification_frequency
    @next_notification = next_notification
    @border_color = border_color
    @background_color = background_color
    @field_text_color = field_text_color
    @title_text = title_text
    @required_text = required_text
    @submit_button_text = submit_button_text
    @confirmation_redirect_url = confirmation_redirect_url
    @list_name = list_name
    @list_id = list_id
    @question_collection = question_collection
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}OptinQuestion
#   id - SOAP::SOAPInt
#   name - SOAP::SOAPString
#   type - SOAP::SOAPString
#   question - SOAP::SOAPString
#   position - SOAP::SOAPInt
#   required - SOAP::SOAPInt
class OptinQuestion
  attr_accessor :id
  attr_accessor :name
  attr_accessor :type
  attr_accessor :question
  attr_accessor :position
  attr_accessor :required

  def initialize(id = nil, name = nil, type = nil, question = nil, position = nil, required = nil)
    @id = id
    @name = name
    @type = type
    @question = question
    @position = position
    @required = required
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}OrderByField
#   field_name - SOAP::SOAPString
#   direction - SOAP::SOAPString
class OrderByField
  attr_accessor :field_name
  attr_accessor :direction

  def initialize(field_name = nil, direction = nil)
    @field_name = field_name
    @direction = direction
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}PricingStructureTier
#   minimum - SOAP::SOAPInt
#   maximum - SOAP::SOAPInt
#   unit_price - SOAP::SOAPFloat
class PricingStructureTier
  attr_accessor :minimum
  attr_accessor :maximum
  attr_accessor :unit_price

  def initialize(minimum = nil, maximum = nil, unit_price = nil)
    @minimum = minimum
    @maximum = maximum
    @unit_price = unit_price
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}PurchaseLineItem
#   product_type - SOAP::SOAPString
#   product_details - SOAP::SOAPString
#   quantity - SOAP::SOAPInt
class PurchaseLineItem
  attr_accessor :product_type
  attr_accessor :product_details
  attr_accessor :quantity

  def initialize(product_type = nil, product_details = nil, quantity = nil)
    @product_type = product_type
    @product_details = product_details
    @quantity = quantity
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}RejectedRecordDetail
#   reason_code - SOAP::SOAPString
#   reason - SOAP::SOAPString
#   num_records - SOAP::SOAPInt
class RejectedRecordDetail
  attr_accessor :reason_code
  attr_accessor :reason
  attr_accessor :num_records

  def initialize(reason_code = nil, reason = nil, num_records = nil)
    @reason_code = reason_code
    @reason = reason
    @num_records = num_records
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}SegmentationQuery
#   id - SOAP::SOAPInt
#   name - SOAP::SOAPString
#   operation_type - SOAP::SOAPString
#   description - SOAP::SOAPString
#   inputs - VRAPI::ArrayOfSegmentationQueryInput
#   status - SOAP::SOAPString
#   display_context - SOAP::SOAPString
#   deleted_by - SOAP::SOAPInt
#   delete_date - SOAP::SOAPDateTime
#   last_run_date - SOAP::SOAPDateTime
#   last_run_size - SOAP::SOAPInt
class SegmentationQuery
  attr_accessor :id
  attr_accessor :name
  attr_accessor :operation_type
  attr_accessor :description
  attr_accessor :inputs
  attr_accessor :status
  attr_accessor :display_context
  attr_accessor :deleted_by
  attr_accessor :delete_date
  attr_accessor :last_run_date
  attr_accessor :last_run_size

  def initialize(id = nil, name = nil, operation_type = nil, description = nil, inputs = nil, status = nil, display_context = nil, deleted_by = nil, delete_date = nil, last_run_date = nil, last_run_size = nil)
    @id = id
    @name = name
    @operation_type = operation_type
    @description = description
    @inputs = inputs
    @status = status
    @display_context = display_context
    @deleted_by = deleted_by
    @delete_date = delete_date
    @last_run_date = last_run_date
    @last_run_size = last_run_size
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}SegmentationQueryInput
#   input_type - SOAP::SOAPString
#   ids - VRAPI::ArrayOfInteger
#   constraints - VRAPI::ArrayOfSegmentationQueryInputConstraint
#   input_constraint_conjunction - SOAP::SOAPString
#   last_run_date - SOAP::SOAPDateTime
#   last_run_size - SOAP::SOAPInt
class SegmentationQueryInput
  attr_accessor :input_type
  attr_accessor :ids
  attr_accessor :constraints
  attr_accessor :input_constraint_conjunction
  attr_accessor :last_run_date
  attr_accessor :last_run_size

  def initialize(input_type = nil, ids = nil, constraints = nil, input_constraint_conjunction = nil, last_run_date = nil, last_run_size = nil)
    @input_type = input_type
    @ids = ids
    @constraints = constraints
    @input_constraint_conjunction = input_constraint_conjunction
    @last_run_date = last_run_date
    @last_run_size = last_run_size
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}SegmentationQueryInputConstraint
#   constrained_entity - SOAP::SOAPString
#   constrained_field - SOAP::SOAPString
#   constraint_operator - SOAP::SOAPString
#   constraint_values - VRAPI::ArrayOfString
#   constrained_field_start_date - SOAP::SOAPDateTime
#   constrained_field_end_date - SOAP::SOAPDateTime
#   match_if_field_missing - SOAP::SOAPBoolean
class SegmentationQueryInputConstraint
  attr_accessor :constrained_entity
  attr_accessor :constrained_field
  attr_accessor :constraint_operator
  attr_accessor :constraint_values
  attr_accessor :constrained_field_start_date
  attr_accessor :constrained_field_end_date
  attr_accessor :match_if_field_missing

  def initialize(constrained_entity = nil, constrained_field = nil, constraint_operator = nil, constraint_values = nil, constrained_field_start_date = nil, constrained_field_end_date = nil, match_if_field_missing = nil)
    @constrained_entity = constrained_entity
    @constrained_field = constrained_field
    @constraint_operator = constraint_operator
    @constraint_values = constraint_values
    @constrained_field_start_date = constrained_field_start_date
    @constrained_field_end_date = constrained_field_end_date
    @match_if_field_missing = match_if_field_missing
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}SegmentationQueryOutputList
#   name - SOAP::SOAPString
#   list_type - SOAP::SOAPString
#   num_records - SOAP::SOAPInt
class SegmentationQueryOutputList
  attr_accessor :name
  attr_accessor :list_type
  attr_accessor :num_records

  def initialize(name = nil, list_type = nil, num_records = nil)
    @name = name
    @list_type = list_type
    @num_records = num_records
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}SfMergedFieldRecord
#   sf_field - SOAP::SOAPString
#   vr_field - SOAP::SOAPString
class SfMergedFieldRecord
  attr_accessor :sf_field
  attr_accessor :vr_field

  def initialize(sf_field = nil, vr_field = nil)
    @sf_field = sf_field
    @vr_field = vr_field
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}StreetAddress
#   address_1 - SOAP::SOAPString
#   address_2 - SOAP::SOAPString
#   city - SOAP::SOAPString
#   state - SOAP::SOAPString
#   postalcode - SOAP::SOAPString
#   country - SOAP::SOAPString
class StreetAddress
  attr_accessor :address_1
  attr_accessor :address_2
  attr_accessor :city
  attr_accessor :state
  attr_accessor :postalcode
  attr_accessor :country

  def initialize(address_1 = nil, address_2 = nil, city = nil, state = nil, postalcode = nil, country = nil)
    @address_1 = address_1
    @address_2 = address_2
    @city = city
    @state = state
    @postalcode = postalcode
    @country = country
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}Survey
#   id - SOAP::SOAPInt
#   name - SOAP::SOAPString
#   description - SOAP::SOAPString
#   status - SOAP::SOAPString
#   survey_hash - SOAP::SOAPString
class Survey
  attr_accessor :id
  attr_accessor :name
  attr_accessor :description
  attr_accessor :status
  attr_accessor :survey_hash

  def initialize(id = nil, name = nil, description = nil, status = nil, survey_hash = nil)
    @id = id
    @name = name
    @description = description
    @status = status
    @survey_hash = survey_hash
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}SurveyInvitation
#   survey_id - SOAP::SOAPInt
#   campaign_id - SOAP::SOAPInt
class SurveyInvitation
  attr_accessor :survey_id
  attr_accessor :campaign_id

  def initialize(survey_id = nil, campaign_id = nil)
    @survey_id = survey_id
    @campaign_id = campaign_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}TemplateCampaignModule
#   position - SOAP::SOAPInt
#   template_id - SOAP::SOAPInt
#   hash - SOAP::SOAPString
#   title - SOAP::SOAPString
#   copy - SOAP::SOAPString
#   redirect_url - SOAP::SOAPString
#   click_text - SOAP::SOAPString
#   images - VRAPI::ArrayOfFileSpec
class TemplateCampaignModule
  attr_accessor :position
  attr_accessor :template_id
  attr_accessor :hash
  attr_accessor :title
  attr_accessor :copy
  attr_accessor :redirect_url
  attr_accessor :click_text
  attr_accessor :images

  def initialize(position = nil, template_id = nil, hash = nil, title = nil, copy = nil, redirect_url = nil, click_text = nil, images = nil)
    @position = position
    @template_id = template_id
    @hash = hash
    @title = title
    @copy = copy
    @redirect_url = redirect_url
    @click_text = click_text
    @images = images
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}User
#   id - SOAP::SOAPInt
#   email_address - SOAP::SOAPString
#   company_id - SOAP::SOAPInt
#   password - SOAP::SOAPString
#   first_name - SOAP::SOAPString
#   last_name - SOAP::SOAPString
#   address_1 - SOAP::SOAPString
#   address_2 - SOAP::SOAPString
#   city - SOAP::SOAPString
#   state - SOAP::SOAPString
#   postalcode - SOAP::SOAPString
#   country - SOAP::SOAPString
#   timezone - SOAP::SOAPString
#   creation_date - SOAP::SOAPDateTime
#   phone - SOAP::SOAPString
#   fax - SOAP::SOAPString
#   url - SOAP::SOAPString
#   last_activity_date - SOAP::SOAPDateTime
#   offer_optin - SOAP::SOAPBoolean
#   newsletter_optin - SOAP::SOAPBoolean
#   password_question - SOAP::SOAPString
#   promotion - SOAP::SOAPString
class User
  attr_accessor :id
  attr_accessor :email_address
  attr_accessor :company_id
  attr_accessor :password
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :address_1
  attr_accessor :address_2
  attr_accessor :city
  attr_accessor :state
  attr_accessor :postalcode
  attr_accessor :country
  attr_accessor :timezone
  attr_accessor :creation_date
  attr_accessor :phone
  attr_accessor :fax
  attr_accessor :url
  attr_accessor :last_activity_date
  attr_accessor :offer_optin
  attr_accessor :newsletter_optin
  attr_accessor :password_question
  attr_accessor :promotion

  def initialize(id = nil, email_address = nil, company_id = nil, password = nil, first_name = nil, last_name = nil, address_1 = nil, address_2 = nil, city = nil, state = nil, postalcode = nil, country = nil, timezone = nil, creation_date = nil, phone = nil, fax = nil, url = nil, last_activity_date = nil, offer_optin = nil, newsletter_optin = nil, password_question = nil, promotion = nil)
    @id = id
    @email_address = email_address
    @company_id = company_id
    @password = password
    @first_name = first_name
    @last_name = last_name
    @address_1 = address_1
    @address_2 = address_2
    @city = city
    @state = state
    @postalcode = postalcode
    @country = country
    @timezone = timezone
    @creation_date = creation_date
    @phone = phone
    @fax = fax
    @url = url
    @last_activity_date = last_activity_date
    @offer_optin = offer_optin
    @newsletter_optin = newsletter_optin
    @password_question = password_question
    @promotion = promotion
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}addListMemberArgs
#   session_id - SOAP::SOAPString
#   list_member - VRAPI::ListMember
#   validate_postal_address - SOAP::SOAPBoolean
class AddListMemberArgs
  attr_accessor :session_id
  attr_accessor :list_member
  attr_accessor :validate_postal_address

  def initialize(session_id = nil, list_member = nil, validate_postal_address = nil)
    @session_id = session_id
    @list_member = list_member
    @validate_postal_address = validate_postal_address
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}appendFileToListArgs
#   session_id - SOAP::SOAPString
#   list_id - SOAP::SOAPInt
#   file - VRAPI::FileSpec
#   fields - VRAPI::ArrayOfString
#   validate_postal_addresses - SOAP::SOAPBoolean
#   notification_email_address - SOAP::SOAPString
class AppendFileToListArgs
  attr_accessor :session_id
  attr_accessor :list_id
  attr_accessor :file
  attr_accessor :fields
  attr_accessor :validate_postal_addresses
  attr_accessor :notification_email_address

  def initialize(session_id = nil, list_id = nil, file = nil, fields = nil, validate_postal_addresses = nil, notification_email_address = nil)
    @session_id = session_id
    @list_id = list_id
    @file = file
    @fields = fields
    @validate_postal_addresses = validate_postal_addresses
    @notification_email_address = notification_email_address
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}appendFileToListResult
#   list_id - SOAP::SOAPInt
#   list_name - SOAP::SOAPString
#   total_records - SOAP::SOAPInt
#   records_loaded - SOAP::SOAPInt
#   records_rejected - SOAP::SOAPInt
#   new_list_size - SOAP::SOAPInt
#   new_mailable_size - SOAP::SOAPInt
#   rejected_records_detail - VRAPI::ArrayOfRejectedRecordDetail
#   rejected_records_file - VRAPI::FileSpec
class AppendFileToListResult
  attr_accessor :list_id
  attr_accessor :list_name
  attr_accessor :total_records
  attr_accessor :records_loaded
  attr_accessor :records_rejected
  attr_accessor :new_list_size
  attr_accessor :new_mailable_size
  attr_accessor :rejected_records_detail
  attr_accessor :rejected_records_file

  def initialize(list_id = nil, list_name = nil, total_records = nil, records_loaded = nil, records_rejected = nil, new_list_size = nil, new_mailable_size = nil, rejected_records_detail = nil, rejected_records_file = nil)
    @list_id = list_id
    @list_name = list_name
    @total_records = total_records
    @records_loaded = records_loaded
    @records_rejected = records_rejected
    @new_list_size = new_list_size
    @new_mailable_size = new_mailable_size
    @rejected_records_detail = rejected_records_detail
    @rejected_records_file = rejected_records_file
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}appendTemplateCampaignModuleArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
#   m_module - VRAPI::TemplateCampaignModule
class AppendTemplateCampaignModuleArgs
  attr_accessor :session_id
  attr_accessor :campaign_id

  def m_module
    @v_module
  end

  def m_module=(value)
    @v_module = value
  end

  def initialize(session_id = nil, campaign_id = nil, v_module = nil)
    @session_id = session_id
    @campaign_id = campaign_id
    @v_module = v_module
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}calculateCampaignAudienceArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
class CalculateCampaignAudienceArgs
  attr_accessor :session_id
  attr_accessor :campaign_id

  def initialize(session_id = nil, campaign_id = nil)
    @session_id = session_id
    @campaign_id = campaign_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}calculateCampaignAudienceResult
#   audience_size - SOAP::SOAPInt
#   total_size - SOAP::SOAPInt
#   total_mailable - SOAP::SOAPInt
#   rejected_records_detail - VRAPI::ArrayOfRejectedRecordDetail
class CalculateCampaignAudienceResult
  attr_accessor :audience_size
  attr_accessor :total_size
  attr_accessor :total_mailable
  attr_accessor :rejected_records_detail

  def initialize(audience_size = nil, total_size = nil, total_mailable = nil, rejected_records_detail = nil)
    @audience_size = audience_size
    @total_size = total_size
    @total_mailable = total_mailable
    @rejected_records_detail = rejected_records_detail
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}canCallMethodArgs
#   session_id - SOAP::SOAPString
#   method_name - SOAP::SOAPString
class CanCallMethodArgs
  attr_accessor :session_id
  attr_accessor :method_name

  def initialize(session_id = nil, method_name = nil)
    @session_id = session_id
    @method_name = method_name
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}compileCampaignRecipientResultsArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
#   list_name - SOAP::SOAPString
#   fields_to_include - VRAPI::ArrayOfString
#   restrict_responses - VRAPI::ArrayOfString
#   restrict_lists - VRAPI::ArrayOfInteger
#   notification_email_address - SOAP::SOAPString
class CompileCampaignRecipientResultsArgs
  attr_accessor :session_id
  attr_accessor :campaign_id
  attr_accessor :list_name
  attr_accessor :fields_to_include
  attr_accessor :restrict_responses
  attr_accessor :restrict_lists
  attr_accessor :notification_email_address

  def initialize(session_id = nil, campaign_id = nil, list_name = nil, fields_to_include = nil, restrict_responses = nil, restrict_lists = nil, notification_email_address = nil)
    @session_id = session_id
    @campaign_id = campaign_id
    @list_name = list_name
    @fields_to_include = fields_to_include
    @restrict_responses = restrict_responses
    @restrict_lists = restrict_lists
    @notification_email_address = notification_email_address
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}compileCampaignRecipientResultsResult
#   list_id - SOAP::SOAPInt
#   num_records - SOAP::SOAPInt
class CompileCampaignRecipientResultsResult
  attr_accessor :list_id
  attr_accessor :num_records

  def initialize(list_id = nil, num_records = nil)
    @list_id = list_id
    @num_records = num_records
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}compileSegmentationQueryArgs
#   session_id - SOAP::SOAPString
#   segmentation_query_id - SOAP::SOAPInt
#   output_lists - VRAPI::ArrayOfSegmentationQueryOutputList
#   notification_email_address - SOAP::SOAPString
class CompileSegmentationQueryArgs
  attr_accessor :session_id
  attr_accessor :segmentation_query_id
  attr_accessor :output_lists
  attr_accessor :notification_email_address

  def initialize(session_id = nil, segmentation_query_id = nil, output_lists = nil, notification_email_address = nil)
    @session_id = session_id
    @segmentation_query_id = segmentation_query_id
    @output_lists = output_lists
    @notification_email_address = notification_email_address
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}createEmailCampaignArgs
#   session_id - SOAP::SOAPString
#   email_campaign - VRAPI::EmailCampaign
class CreateEmailCampaignArgs
  attr_accessor :session_id
  attr_accessor :email_campaign

  def initialize(session_id = nil, email_campaign = nil)
    @session_id = session_id
    @email_campaign = email_campaign
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}createFileArgs
#   session_id - SOAP::SOAPString
#   file - VRAPI::FileSpec
#   force - SOAP::SOAPBoolean
class CreateFileArgs
  attr_accessor :session_id
  attr_accessor :file
  attr_accessor :force

  def initialize(session_id = nil, file = nil, force = nil)
    @session_id = session_id
    @file = file
    @force = force
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}createListArgs
#   session_id - SOAP::SOAPString
#   name - SOAP::SOAPString
#   type - SOAP::SOAPString
#   custom_field_names - VRAPI::ArrayOfString
class CreateListArgs
  attr_accessor :session_id
  attr_accessor :name
  attr_accessor :type
  attr_accessor :custom_field_names

  def initialize(session_id = nil, name = nil, type = nil, custom_field_names = nil)
    @session_id = session_id
    @name = name
    @type = type
    @custom_field_names = custom_field_names
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}createOptinFormArgs
#   session_id - SOAP::SOAPString
#   optin_form - VRAPI::OptinForm
class CreateOptinFormArgs
  attr_accessor :session_id
  attr_accessor :optin_form

  def initialize(session_id = nil, optin_form = nil)
    @session_id = session_id
    @optin_form = optin_form
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}createSegmentationQueryArgs
#   session_id - SOAP::SOAPString
#   segmentation_query - VRAPI::SegmentationQuery
class CreateSegmentationQueryArgs
  attr_accessor :session_id
  attr_accessor :segmentation_query

  def initialize(session_id = nil, segmentation_query = nil)
    @session_id = session_id
    @segmentation_query = segmentation_query
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}createSfListArgs
#   session_id - SOAP::SOAPString
#   sf_session_id - SOAP::SOAPString
#   sf_endpoint - SOAP::SOAPString
#   list_name - SOAP::SOAPString
#   list_type - SOAP::SOAPString
#   sfdc_query_id - SOAP::SOAPInteger
#   lead_soql - SOAP::SOAPString
#   contact_soql - SOAP::SOAPString
#   append_to_sfdc_campaign_id - SOAP::SOAPString
#   validate_postal_addresses - SOAP::SOAPBoolean
#   notification_email_address - SOAP::SOAPString
class CreateSfListArgs
  attr_accessor :session_id
  attr_accessor :sf_session_id
  attr_accessor :sf_endpoint
  attr_accessor :list_name
  attr_accessor :list_type
  attr_accessor :sfdc_query_id
  attr_accessor :lead_soql
  attr_accessor :contact_soql
  attr_accessor :append_to_sfdc_campaign_id
  attr_accessor :validate_postal_addresses
  attr_accessor :notification_email_address

  def initialize(session_id = nil, sf_session_id = nil, sf_endpoint = nil, list_name = nil, list_type = nil, sfdc_query_id = nil, lead_soql = nil, contact_soql = nil, append_to_sfdc_campaign_id = nil, validate_postal_addresses = nil, notification_email_address = nil)
    @session_id = session_id
    @sf_session_id = sf_session_id
    @sf_endpoint = sf_endpoint
    @list_name = list_name
    @list_type = list_type
    @sfdc_query_id = sfdc_query_id
    @lead_soql = lead_soql
    @contact_soql = contact_soql
    @append_to_sfdc_campaign_id = append_to_sfdc_campaign_id
    @validate_postal_addresses = validate_postal_addresses
    @notification_email_address = notification_email_address
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}deleteCampaignArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
class DeleteCampaignArgs
  attr_accessor :session_id
  attr_accessor :campaign_id

  def initialize(session_id = nil, campaign_id = nil)
    @session_id = session_id
    @campaign_id = campaign_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}deleteFileArgs
#   session_id - SOAP::SOAPString
#   file - SOAP::SOAPString
#   move_to_trash - SOAP::SOAPBoolean
#   force - SOAP::SOAPBoolean
class DeleteFileArgs
  attr_accessor :session_id
  attr_accessor :file
  attr_accessor :move_to_trash
  attr_accessor :force

  def initialize(session_id = nil, file = nil, move_to_trash = nil, force = nil)
    @session_id = session_id
    @file = file
    @move_to_trash = move_to_trash
    @force = force
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}deleteListArgs
#   session_id - SOAP::SOAPString
#   list_id - SOAP::SOAPInt
class DeleteListArgs
  attr_accessor :session_id
  attr_accessor :list_id

  def initialize(session_id = nil, list_id = nil)
    @session_id = session_id
    @list_id = list_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}deleteListMemberArgs
#   session_id - SOAP::SOAPString
#   list_member - VRAPI::ListMember
class DeleteListMemberArgs
  attr_accessor :session_id
  attr_accessor :list_member

  def initialize(session_id = nil, list_member = nil)
    @session_id = session_id
    @list_member = list_member
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}deleteSegmentationQueryArgs
#   session_id - SOAP::SOAPString
#   segmentation_query_id - SOAP::SOAPInt
class DeleteSegmentationQueryArgs
  attr_accessor :session_id
  attr_accessor :segmentation_query_id

  def initialize(session_id = nil, segmentation_query_id = nil)
    @session_id = session_id
    @segmentation_query_id = segmentation_query_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}deleteTemplateCampaignModuleArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
#   position - SOAP::SOAPInt
class DeleteTemplateCampaignModuleArgs
  attr_accessor :session_id
  attr_accessor :campaign_id
  attr_accessor :position

  def initialize(session_id = nil, campaign_id = nil, position = nil)
    @session_id = session_id
    @campaign_id = campaign_id
    @position = position
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}downloadCampaignRecipientResultsArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
#   delimiter - SOAP::SOAPString
#   remove_duplicates - SOAP::SOAPBoolean
#   fields_to_include - VRAPI::ArrayOfString
#   restrict_responses - VRAPI::ArrayOfString
#   restrict_lists - VRAPI::ArrayOfInteger
#   notification_email_address - SOAP::SOAPString
#   start_date - SOAP::SOAPString
#   end_date - SOAP::SOAPString
class DownloadCampaignRecipientResultsArgs
  attr_accessor :session_id
  attr_accessor :campaign_id
  attr_accessor :delimiter
  attr_accessor :remove_duplicates
  attr_accessor :fields_to_include
  attr_accessor :restrict_responses
  attr_accessor :restrict_lists
  attr_accessor :notification_email_address
  attr_accessor :start_date
  attr_accessor :end_date

  def initialize(session_id = nil, campaign_id = nil, delimiter = nil, remove_duplicates = nil, fields_to_include = nil, restrict_responses = nil, restrict_lists = nil, notification_email_address = nil, start_date = nil, end_date = nil)
    @session_id = session_id
    @campaign_id = campaign_id
    @delimiter = delimiter
    @remove_duplicates = remove_duplicates
    @fields_to_include = fields_to_include
    @restrict_responses = restrict_responses
    @restrict_lists = restrict_lists
    @notification_email_address = notification_email_address
    @start_date = start_date
    @end_date = end_date
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}downloadCampaignRecipientResultsResult
#   campaign_id - SOAP::SOAPInt
#   num_records - SOAP::SOAPInt
#   contents - VRAPI::FileSpec
#   included_fields - VRAPI::ArrayOfString
#   restricted_responses - VRAPI::ArrayOfString
#   restricted_lists - VRAPI::ArrayOfInteger
class DownloadCampaignRecipientResultsResult
  attr_accessor :campaign_id
  attr_accessor :num_records
  attr_accessor :contents
  attr_accessor :included_fields
  attr_accessor :restricted_responses
  attr_accessor :restricted_lists

  def initialize(campaign_id = nil, num_records = nil, contents = nil, included_fields = nil, restricted_responses = nil, restricted_lists = nil)
    @campaign_id = campaign_id
    @num_records = num_records
    @contents = contents
    @included_fields = included_fields
    @restricted_responses = restricted_responses
    @restricted_lists = restricted_lists
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}downloadCompanyUnsubscribesAndBouncesArgs
#   session_id - SOAP::SOAPString
#   delimiter - SOAP::SOAPString
#   include_org_linked_unsubs - SOAP::SOAPBoolean
#   exclude_campaign_unsubs - SOAP::SOAPBoolean
#   start_date - SOAP::SOAPString
#   end_date - SOAP::SOAPString
class DownloadCompanyUnsubscribesAndBouncesArgs
  attr_accessor :session_id
  attr_accessor :delimiter
  attr_accessor :include_org_linked_unsubs
  attr_accessor :exclude_campaign_unsubs
  attr_accessor :start_date
  attr_accessor :end_date

  def initialize(session_id = nil, delimiter = nil, include_org_linked_unsubs = nil, exclude_campaign_unsubs = nil, start_date = nil, end_date = nil)
    @session_id = session_id
    @delimiter = delimiter
    @include_org_linked_unsubs = include_org_linked_unsubs
    @exclude_campaign_unsubs = exclude_campaign_unsubs
    @start_date = start_date
    @end_date = end_date
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}downloadCompanyUnsubscribesAndBouncesResult
#   num_records - SOAP::SOAPInt
#   contents - VRAPI::FileSpec
class DownloadCompanyUnsubscribesAndBouncesResult
  attr_accessor :num_records
  attr_accessor :contents

  def initialize(num_records = nil, contents = nil)
    @num_records = num_records
    @contents = contents
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}downloadListArgs
#   session_id - SOAP::SOAPString
#   list_id - SOAP::SOAPInt
#   delimiter - SOAP::SOAPString
#   fields_to_include - VRAPI::ArrayOfString
#   restrict_to - VRAPI::ArrayOfString
#   notification_email_address - SOAP::SOAPString
class DownloadListArgs
  attr_accessor :session_id
  attr_accessor :list_id
  attr_accessor :delimiter
  attr_accessor :fields_to_include
  attr_accessor :restrict_to
  attr_accessor :notification_email_address

  def initialize(session_id = nil, list_id = nil, delimiter = nil, fields_to_include = nil, restrict_to = nil, notification_email_address = nil)
    @session_id = session_id
    @list_id = list_id
    @delimiter = delimiter
    @fields_to_include = fields_to_include
    @restrict_to = restrict_to
    @notification_email_address = notification_email_address
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}downloadListResult
#   list_id - SOAP::SOAPInt
#   num_records - SOAP::SOAPInt
#   contents - VRAPI::FileSpec
#   delimiter - SOAP::SOAPString
#   included_fields - VRAPI::ArrayOfString
#   restricted_to - VRAPI::ArrayOfString
class DownloadListResult
  attr_accessor :list_id
  attr_accessor :num_records
  attr_accessor :contents
  attr_accessor :delimiter
  attr_accessor :included_fields
  attr_accessor :restricted_to

  def initialize(list_id = nil, num_records = nil, contents = nil, delimiter = nil, included_fields = nil, restricted_to = nil)
    @list_id = list_id
    @num_records = num_records
    @contents = contents
    @delimiter = delimiter
    @included_fields = included_fields
    @restricted_to = restricted_to
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}editCompanyArgs
#   session_id - SOAP::SOAPString
#   company - VRAPI::Company
class EditCompanyArgs
  attr_accessor :session_id
  attr_accessor :company

  def initialize(session_id = nil, company = nil)
    @session_id = session_id
    @company = company
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}editListAttributeArgs
#   session_id - SOAP::SOAPString
#   list_id - SOAP::SOAPInt
#   attribute_name - SOAP::SOAPString
#   attribute_value - SOAP::SOAPString
class EditListAttributeArgs
  attr_accessor :session_id
  attr_accessor :list_id
  attr_accessor :attribute_name
  attr_accessor :attribute_value

  def initialize(session_id = nil, list_id = nil, attribute_name = nil, attribute_value = nil)
    @session_id = session_id
    @list_id = list_id
    @attribute_name = attribute_name
    @attribute_value = attribute_value
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}editListMemberArgs
#   session_id - SOAP::SOAPString
#   list_member - VRAPI::ListMember
#   validate_postal_address - SOAP::SOAPBoolean
class EditListMemberArgs
  attr_accessor :session_id
  attr_accessor :list_member
  attr_accessor :validate_postal_address

  def initialize(session_id = nil, list_member = nil, validate_postal_address = nil)
    @session_id = session_id
    @list_member = list_member
    @validate_postal_address = validate_postal_address
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}editListMembersArgs
#   session_id - SOAP::SOAPString
#   list_members - VRAPI::ArrayOfListMember
#   validate_postal_address - SOAP::SOAPBoolean
class EditListMembersArgs
  attr_accessor :session_id
  attr_accessor :list_members
  attr_accessor :validate_postal_address

  def initialize(session_id = nil, list_members = nil, validate_postal_address = nil)
    @session_id = session_id
    @list_members = list_members
    @validate_postal_address = validate_postal_address
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}editSegmentationQueryArgs
#   session_id - SOAP::SOAPString
#   segmentation_query - VRAPI::SegmentationQuery
class EditSegmentationQueryArgs
  attr_accessor :session_id
  attr_accessor :segmentation_query

  def initialize(session_id = nil, segmentation_query = nil)
    @session_id = session_id
    @segmentation_query = segmentation_query
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}editUserArgs
#   session_id - SOAP::SOAPString
#   user - VRAPI::User
class EditUserArgs
  attr_accessor :session_id
  attr_accessor :user

  def initialize(session_id = nil, user = nil)
    @session_id = session_id
    @user = user
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}emptyTrashArgs
#   session_id - SOAP::SOAPString
class EmptyTrashArgs
  attr_accessor :session_id

  def initialize(session_id = nil)
    @session_id = session_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}enumerateEmailCampaignsArgs
#   session_id - SOAP::SOAPString
#   campaign_ids - VRAPI::ArrayOfInteger
#   statuses - VRAPI::ArrayOfString
#   include_content - SOAP::SOAPBoolean
#   include_deleted - SOAP::SOAPBoolean
#   order_by_fields - VRAPI::ArrayOfOrderByField
#   limit - SOAP::SOAPInt
#   offset - SOAP::SOAPInt
class EnumerateEmailCampaignsArgs
  attr_accessor :session_id
  attr_accessor :campaign_ids
  attr_accessor :statuses
  attr_accessor :include_content
  attr_accessor :include_deleted
  attr_accessor :order_by_fields
  attr_accessor :limit
  attr_accessor :offset

  def initialize(session_id = nil, campaign_ids = nil, statuses = nil, include_content = nil, include_deleted = nil, order_by_fields = nil, limit = nil, offset = nil)
    @session_id = session_id
    @campaign_ids = campaign_ids
    @statuses = statuses
    @include_content = include_content
    @include_deleted = include_deleted
    @order_by_fields = order_by_fields
    @limit = limit
    @offset = offset
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}enumerateFilesArgs
#   session_id - SOAP::SOAPString
#   base_directory - SOAP::SOAPString
#   recurse_subdirectories - SOAP::SOAPBoolean
class EnumerateFilesArgs
  attr_accessor :session_id
  attr_accessor :base_directory
  attr_accessor :recurse_subdirectories

  def initialize(session_id = nil, base_directory = nil, recurse_subdirectories = nil)
    @session_id = session_id
    @base_directory = base_directory
    @recurse_subdirectories = recurse_subdirectories
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}enumerateListsArgs
#   session_id - SOAP::SOAPString
#   list_id - SOAP::SOAPInt
#   type - SOAP::SOAPString
#   name - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
#   form_id - SOAP::SOAPInt
#   include_field_info - SOAP::SOAPBoolean
#   include_deleted_lists - SOAP::SOAPBoolean
#   order_by - SOAP::SOAPString
#   limit - SOAP::SOAPInt
#   offset - SOAP::SOAPInt
class EnumerateListsArgs
  attr_accessor :session_id
  attr_accessor :list_id
  attr_accessor :type
  attr_accessor :name
  attr_accessor :campaign_id
  attr_accessor :form_id
  attr_accessor :include_field_info
  attr_accessor :include_deleted_lists
  attr_accessor :order_by
  attr_accessor :limit
  attr_accessor :offset

  def initialize(session_id = nil, list_id = nil, type = nil, name = nil, campaign_id = nil, form_id = nil, include_field_info = nil, include_deleted_lists = nil, order_by = nil, limit = nil, offset = nil)
    @session_id = session_id
    @list_id = list_id
    @type = type
    @name = name
    @campaign_id = campaign_id
    @form_id = form_id
    @include_field_info = include_field_info
    @include_deleted_lists = include_deleted_lists
    @order_by = order_by
    @limit = limit
    @offset = offset
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}enumerateSegmentationQueriesArgs
#   session_id - SOAP::SOAPString
#   segmentation_query_id - SOAP::SOAPInt
#   include_query_detail - SOAP::SOAPBoolean
class EnumerateSegmentationQueriesArgs
  attr_accessor :session_id
  attr_accessor :segmentation_query_id
  attr_accessor :include_query_detail

  def initialize(session_id = nil, segmentation_query_id = nil, include_query_detail = nil)
    @session_id = session_id
    @segmentation_query_id = segmentation_query_id
    @include_query_detail = include_query_detail
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}eraseListMembersArgs
#   session_id - SOAP::SOAPString
#   list_id - SOAP::SOAPInt
class EraseListMembersArgs
  attr_accessor :session_id
  attr_accessor :list_id

  def initialize(session_id = nil, list_id = nil)
    @session_id = session_id
    @list_id = list_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}fetchBackgroundResultArgs
#   session_id - SOAP::SOAPString
#   background_task_id - SOAP::SOAPInt
class FetchBackgroundResultArgs
  attr_accessor :session_id
  attr_accessor :background_task_id

  def initialize(session_id = nil, background_task_id = nil)
    @session_id = session_id
    @background_task_id = background_task_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getBackgroundTaskStatusArgs
#   session_id - SOAP::SOAPString
#   background_task_id - SOAP::SOAPInt
class GetBackgroundTaskStatusArgs
  attr_accessor :session_id
  attr_accessor :background_task_id

  def initialize(session_id = nil, background_task_id = nil)
    @session_id = session_id
    @background_task_id = background_task_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getCampaignDomainCountArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
#   max_domains - SOAP::SOAPInt
#   restrict_domains - VRAPI::ArrayOfString
class GetCampaignDomainCountArgs
  attr_accessor :session_id
  attr_accessor :campaign_id
  attr_accessor :max_domains
  attr_accessor :restrict_domains

  def initialize(session_id = nil, campaign_id = nil, max_domains = nil, restrict_domains = nil)
    @session_id = session_id
    @campaign_id = campaign_id
    @max_domains = max_domains
    @restrict_domains = restrict_domains
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getCampaignDomainCountResult
#   campaign_id - SOAP::SOAPInt
#   domain_counts - VRAPI::ArrayOfDomainCount
class GetCampaignDomainCountResult
  attr_accessor :campaign_id
  attr_accessor :domain_counts

  def initialize(campaign_id = nil, domain_counts = nil)
    @campaign_id = campaign_id
    @domain_counts = domain_counts
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getCompanyArgs
#   session_id - SOAP::SOAPString
#   company_id - SOAP::SOAPInt
#   include_users - SOAP::SOAPBoolean
class GetCompanyArgs
  attr_accessor :session_id
  attr_accessor :company_id
  attr_accessor :include_users

  def initialize(session_id = nil, company_id = nil, include_users = nil)
    @session_id = session_id
    @company_id = company_id
    @include_users = include_users
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getCompanySummaryArgs
#   session_id - SOAP::SOAPString
#   categories - VRAPI::ArrayOfString
class GetCompanySummaryArgs
  attr_accessor :session_id
  attr_accessor :categories

  def initialize(session_id = nil, categories = nil)
    @session_id = session_id
    @categories = categories
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getEmailCampaignDeclineHistoryArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
class GetEmailCampaignDeclineHistoryArgs
  attr_accessor :session_id
  attr_accessor :campaign_id

  def initialize(session_id = nil, campaign_id = nil)
    @session_id = session_id
    @campaign_id = campaign_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getEmailCampaignResponseHistogramsArgs
#   session_id - SOAP::SOAPString
#   campaign_ids - VRAPI::ArrayOfInteger
#   response_types - VRAPI::ArrayOfString
#   bins - SOAP::SOAPInt
#   min_minutes_since_launch - SOAP::SOAPInt
#   max_minutes_since_launch - SOAP::SOAPInt
class GetEmailCampaignResponseHistogramsArgs
  attr_accessor :session_id
  attr_accessor :campaign_ids
  attr_accessor :response_types
  attr_accessor :bins
  attr_accessor :min_minutes_since_launch
  attr_accessor :max_minutes_since_launch

  def initialize(session_id = nil, campaign_ids = nil, response_types = nil, bins = nil, min_minutes_since_launch = nil, max_minutes_since_launch = nil)
    @session_id = session_id
    @campaign_ids = campaign_ids
    @response_types = response_types
    @bins = bins
    @min_minutes_since_launch = min_minutes_since_launch
    @max_minutes_since_launch = max_minutes_since_launch
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getEmailCampaignStatsArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
#   include_link_stats - SOAP::SOAPBoolean
#   include_domain_stats - SOAP::SOAPBoolean
class GetEmailCampaignStatsArgs
  attr_accessor :session_id
  attr_accessor :campaign_id
  attr_accessor :include_link_stats
  attr_accessor :include_domain_stats

  def initialize(session_id = nil, campaign_id = nil, include_link_stats = nil, include_domain_stats = nil)
    @session_id = session_id
    @campaign_id = campaign_id
    @include_link_stats = include_link_stats
    @include_domain_stats = include_domain_stats
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getEmailCreditBalanceArgs
#   session_id - SOAP::SOAPString
#   company_id - SOAP::SOAPInt
class GetEmailCreditBalanceArgs
  attr_accessor :session_id
  attr_accessor :company_id

  def initialize(session_id = nil, company_id = nil)
    @session_id = session_id
    @company_id = company_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getListDomainCountArgs
#   session_id - SOAP::SOAPString
#   list_id - SOAP::SOAPInt
#   max_domains - SOAP::SOAPInt
#   restrict_domains - VRAPI::ArrayOfString
class GetListDomainCountArgs
  attr_accessor :session_id
  attr_accessor :list_id
  attr_accessor :max_domains
  attr_accessor :restrict_domains

  def initialize(session_id = nil, list_id = nil, max_domains = nil, restrict_domains = nil)
    @session_id = session_id
    @list_id = list_id
    @max_domains = max_domains
    @restrict_domains = restrict_domains
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getListDomainCountResult
#   list_id - SOAP::SOAPInt
#   domain_counts - VRAPI::ArrayOfDomainCount
class GetListDomainCountResult
  attr_accessor :list_id
  attr_accessor :domain_counts

  def initialize(list_id = nil, domain_counts = nil)
    @list_id = list_id
    @domain_counts = domain_counts
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getListMemberByAddressHashArgs
#   session_id - SOAP::SOAPString
#   list_id - SOAP::SOAPInt
#   address_hash - SOAP::SOAPString
class GetListMemberByAddressHashArgs
  attr_accessor :session_id
  attr_accessor :list_id
  attr_accessor :address_hash

  def initialize(session_id = nil, list_id = nil, address_hash = nil)
    @session_id = session_id
    @list_id = list_id
    @address_hash = address_hash
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getListMemberByEmailAddressArgs
#   session_id - SOAP::SOAPString
#   list_id - SOAP::SOAPInt
#   email_address - SOAP::SOAPString
class GetListMemberByEmailAddressArgs
  attr_accessor :session_id
  attr_accessor :list_id
  attr_accessor :email_address

  def initialize(session_id = nil, list_id = nil, email_address = nil)
    @session_id = session_id
    @list_id = list_id
    @email_address = email_address
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getListMemberByHashArgs
#   session_id - SOAP::SOAPString
#   list_id - SOAP::SOAPInt
#   hash - SOAP::SOAPString
class GetListMemberByHashArgs
  attr_accessor :session_id
  attr_accessor :list_id
  attr_accessor :hash

  def initialize(session_id = nil, list_id = nil, hash = nil)
    @session_id = session_id
    @list_id = list_id
    @hash = hash
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getListMembersArgs
#   session_id - SOAP::SOAPString
#   list_id - SOAP::SOAPInt
#   max_records - SOAP::SOAPInt
#   offset - SOAP::SOAPInt
#   order_by_fields - VRAPI::ArrayOfOrderByField
#   first_order_by_field_start_at - SOAP::SOAPString
class GetListMembersArgs
  attr_accessor :session_id
  attr_accessor :list_id
  attr_accessor :max_records
  attr_accessor :offset
  attr_accessor :order_by_fields
  attr_accessor :first_order_by_field_start_at

  def initialize(session_id = nil, list_id = nil, max_records = nil, offset = nil, order_by_fields = nil, first_order_by_field_start_at = nil)
    @session_id = session_id
    @list_id = list_id
    @max_records = max_records
    @offset = offset
    @order_by_fields = order_by_fields
    @first_order_by_field_start_at = first_order_by_field_start_at
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getPricingStructureArgs
#   session_id - SOAP::SOAPString
#   product_type - SOAP::SOAPString
#   product_details - SOAP::SOAPString
class GetPricingStructureArgs
  attr_accessor :session_id
  attr_accessor :product_type
  attr_accessor :product_details

  def initialize(session_id = nil, product_type = nil, product_details = nil)
    @session_id = session_id
    @product_type = product_type
    @product_details = product_details
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getPurchaseQuotationArgs
#   session_id - SOAP::SOAPString
#   product_type - SOAP::SOAPString
#   product_details - SOAP::SOAPString
#   quantity - SOAP::SOAPInt
#   promotion_code - SOAP::SOAPString
class GetPurchaseQuotationArgs
  attr_accessor :session_id
  attr_accessor :product_type
  attr_accessor :product_details
  attr_accessor :quantity
  attr_accessor :promotion_code

  def initialize(session_id = nil, product_type = nil, product_details = nil, quantity = nil, promotion_code = nil)
    @session_id = session_id
    @product_type = product_type
    @product_details = product_details
    @quantity = quantity
    @promotion_code = promotion_code
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getPurchaseQuotationResult
#   quoted_price - SOAP::SOAPFloat
#   promotion_code - SOAP::SOAPString
#   promotion_description - SOAP::SOAPString
class GetPurchaseQuotationResult
  attr_accessor :quoted_price
  attr_accessor :promotion_code
  attr_accessor :promotion_description

  def initialize(quoted_price = nil, promotion_code = nil, promotion_description = nil)
    @quoted_price = quoted_price
    @promotion_code = promotion_code
    @promotion_description = promotion_description
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getUserArgs
#   session_id - SOAP::SOAPString
#   user_id - SOAP::SOAPInt
class GetUserArgs
  attr_accessor :session_id
  attr_accessor :user_id

  def initialize(session_id = nil, user_id = nil)
    @session_id = session_id
    @user_id = user_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}getUserByEmailAddressArgs
#   session_id - SOAP::SOAPString
#   email_address - SOAP::SOAPString
class GetUserByEmailAddressArgs
  attr_accessor :session_id
  attr_accessor :email_address

  def initialize(session_id = nil, email_address = nil)
    @session_id = session_id
    @email_address = email_address
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}launchEmailCampaignArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
class LaunchEmailCampaignArgs
  attr_accessor :session_id
  attr_accessor :campaign_id

  def initialize(session_id = nil, campaign_id = nil)
    @session_id = session_id
    @campaign_id = campaign_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}launchEmailCampaignResult
#   total_size - SOAP::SOAPInt
#   total_mailable - SOAP::SOAPInt
#   merge_fields - VRAPI::ArrayOfString
class LaunchEmailCampaignResult
  attr_accessor :total_size
  attr_accessor :total_mailable
  attr_accessor :merge_fields

  def initialize(total_size = nil, total_mailable = nil, merge_fields = nil)
    @total_size = total_size
    @total_mailable = total_mailable
    @merge_fields = merge_fields
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}loginArgs
#   username - SOAP::SOAPString
#   password - SOAP::SOAPString
#   session_duration_minutes - SOAP::SOAPInteger
class LoginArgs
  attr_accessor :username
  attr_accessor :password
  attr_accessor :session_duration_minutes

  def initialize(username = nil, password = nil, session_duration_minutes = nil)
    @username = username
    @password = password
    @session_duration_minutes = session_duration_minutes
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}makeCreditCardPurchaseResult
#   purchase_id - SOAP::SOAPInt
#   gateway_used - SOAP::SOAPString
#   decline_message - SOAP::SOAPString
class MakeCreditCardPurchaseResult
  attr_accessor :purchase_id
  attr_accessor :gateway_used
  attr_accessor :decline_message

  def initialize(purchase_id = nil, gateway_used = nil, decline_message = nil)
    @purchase_id = purchase_id
    @gateway_used = gateway_used
    @decline_message = decline_message
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}moveFileArgs
#   session_id - SOAP::SOAPString
#   source - SOAP::SOAPString
#   target - SOAP::SOAPString
#   force - SOAP::SOAPBoolean
class MoveFileArgs
  attr_accessor :session_id
  attr_accessor :source
  attr_accessor :target
  attr_accessor :force

  def initialize(session_id = nil, source = nil, target = nil, force = nil)
    @session_id = session_id
    @source = source
    @target = target
    @force = force
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}refreshArgs
#   session_id - SOAP::SOAPString
class RefreshArgs
  attr_accessor :session_id

  def initialize(session_id = nil)
    @session_id = session_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}renderCampaignContentArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
#   campaign_hash - SOAP::SOAPString
#   content_type - SOAP::SOAPString
#   view_type - SOAP::SOAPString
#   max_text_line_length - SOAP::SOAPInt
class RenderCampaignContentArgs
  attr_accessor :session_id
  attr_accessor :campaign_id
  attr_accessor :campaign_hash
  attr_accessor :content_type
  attr_accessor :view_type
  attr_accessor :max_text_line_length

  def initialize(session_id = nil, campaign_id = nil, campaign_hash = nil, content_type = nil, view_type = nil, max_text_line_length = nil)
    @session_id = session_id
    @campaign_id = campaign_id
    @campaign_hash = campaign_hash
    @content_type = content_type
    @view_type = view_type
    @max_text_line_length = max_text_line_length
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}renderCampaignContentResult
#   rendered_content - SOAP::SOAPString
#   content_links - VRAPI::ArrayOfCampaignContentLink
class RenderCampaignContentResult
  attr_accessor :rendered_content
  attr_accessor :content_links

  def initialize(rendered_content = nil, content_links = nil)
    @rendered_content = rendered_content
    @content_links = content_links
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}runSegmentationQueryArgs
#   session_id - SOAP::SOAPString
#   segmentation_query_id - SOAP::SOAPInt
#   notification_email_address - SOAP::SOAPString
class RunSegmentationQueryArgs
  attr_accessor :session_id
  attr_accessor :segmentation_query_id
  attr_accessor :notification_email_address

  def initialize(session_id = nil, segmentation_query_id = nil, notification_email_address = nil)
    @session_id = session_id
    @segmentation_query_id = segmentation_query_id
    @notification_email_address = notification_email_address
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}searchListMembersArgs
#   session_id - SOAP::SOAPString
#   field_name - SOAP::SOAPString
#   field_value - SOAP::SOAPString
#   list_id - SOAP::SOAPInt
#   max_records - SOAP::SOAPInt
class SearchListMembersArgs
  attr_accessor :session_id
  attr_accessor :field_name
  attr_accessor :field_value
  attr_accessor :list_id
  attr_accessor :max_records

  def initialize(session_id = nil, field_name = nil, field_value = nil, list_id = nil, max_records = nil)
    @session_id = session_id
    @field_name = field_name
    @field_value = field_value
    @list_id = list_id
    @max_records = max_records
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}sendEmailCampaignTestArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
#   recipients - VRAPI::ArrayOfNVDictionary
class SendEmailCampaignTestArgs
  attr_accessor :session_id
  attr_accessor :campaign_id
  attr_accessor :recipients

  def initialize(session_id = nil, campaign_id = nil, recipients = nil)
    @session_id = session_id
    @campaign_id = campaign_id
    @recipients = recipients
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}sendEmailCampaignTestResult
#   text_content_links - VRAPI::ArrayOfCampaignContentLink
#   html_content_links - VRAPI::ArrayOfCampaignContentLink
class SendEmailCampaignTestResult
  attr_accessor :text_content_links
  attr_accessor :html_content_links

  def initialize(text_content_links = nil, html_content_links = nil)
    @text_content_links = text_content_links
    @html_content_links = html_content_links
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}setCampaignListsArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
#   list_ids - VRAPI::ArrayOfInteger
class SetCampaignListsArgs
  attr_accessor :session_id
  attr_accessor :campaign_id
  attr_accessor :list_ids

  def initialize(session_id = nil, campaign_id = nil, list_ids = nil)
    @session_id = session_id
    @campaign_id = campaign_id
    @list_ids = list_ids
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}setCustomListFieldsArgs
#   session_id - SOAP::SOAPString
#   list_id - SOAP::SOAPInt
#   fields - VRAPI::ArrayOfString
class SetCustomListFieldsArgs
  attr_accessor :session_id
  attr_accessor :list_id
  attr_accessor :fields

  def initialize(session_id = nil, list_id = nil, fields = nil)
    @session_id = session_id
    @list_id = list_id
    @fields = fields
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}setDisplayedListFieldsArgs
#   session_id - SOAP::SOAPString
#   list_id - SOAP::SOAPInt
#   displayed_fields - VRAPI::ArrayOfString
class SetDisplayedListFieldsArgs
  attr_accessor :session_id
  attr_accessor :list_id
  attr_accessor :displayed_fields

  def initialize(session_id = nil, list_id = nil, displayed_fields = nil)
    @session_id = session_id
    @list_id = list_id
    @displayed_fields = displayed_fields
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}setEmailCampaignAttributeArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
#   name - SOAP::SOAPString
#   value - SOAP::SOAPString
class SetEmailCampaignAttributeArgs
  attr_accessor :session_id
  attr_accessor :campaign_id
  attr_accessor :name
  attr_accessor :value

  def initialize(session_id = nil, campaign_id = nil, name = nil, value = nil)
    @session_id = session_id
    @campaign_id = campaign_id
    @name = name
    @value = value
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}setEmailCampaignContentArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
#   content - VRAPI::EmailCampaignContent
class SetEmailCampaignContentArgs
  attr_accessor :session_id
  attr_accessor :campaign_id
  attr_accessor :content

  def initialize(session_id = nil, campaign_id = nil, content = nil)
    @session_id = session_id
    @campaign_id = campaign_id
    @content = content
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}setIndexedListFieldsArgs
#   session_id - SOAP::SOAPString
#   list_id - SOAP::SOAPInt
#   indexed_fields - VRAPI::ArrayOfString
class SetIndexedListFieldsArgs
  attr_accessor :session_id
  attr_accessor :list_id
  attr_accessor :indexed_fields

  def initialize(session_id = nil, list_id = nil, indexed_fields = nil)
    @session_id = session_id
    @list_id = list_id
    @indexed_fields = indexed_fields
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}setTemplateCampaignModuleArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
#   m_module - VRAPI::TemplateCampaignModule
class SetTemplateCampaignModuleArgs
  attr_accessor :session_id
  attr_accessor :campaign_id

  def m_module
    @v_module
  end

  def m_module=(value)
    @v_module = value
  end

  def initialize(session_id = nil, campaign_id = nil, v_module = nil)
    @session_id = session_id
    @campaign_id = campaign_id
    @v_module = v_module
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}transferEmailCreditsArgs
#   session_id - SOAP::SOAPString
#   from_company_id - SOAP::SOAPInt
#   to_company_id - SOAP::SOAPInt
#   credits_to_transfer - SOAP::SOAPInt
class TransferEmailCreditsArgs
  attr_accessor :session_id
  attr_accessor :from_company_id
  attr_accessor :to_company_id
  attr_accessor :credits_to_transfer

  def initialize(session_id = nil, from_company_id = nil, to_company_id = nil, credits_to_transfer = nil)
    @session_id = session_id
    @from_company_id = from_company_id
    @to_company_id = to_company_id
    @credits_to_transfer = credits_to_transfer
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}undeleteCampaignArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
class UndeleteCampaignArgs
  attr_accessor :session_id
  attr_accessor :campaign_id

  def initialize(session_id = nil, campaign_id = nil)
    @session_id = session_id
    @campaign_id = campaign_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}undeleteListArgs
#   session_id - SOAP::SOAPString
#   list_id - SOAP::SOAPInt
class UndeleteListArgs
  attr_accessor :session_id
  attr_accessor :list_id

  def initialize(session_id = nil, list_id = nil)
    @session_id = session_id
    @list_id = list_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}undeleteSegmentationQueryArgs
#   session_id - SOAP::SOAPString
#   segmentation_query_id - SOAP::SOAPInt
class UndeleteSegmentationQueryArgs
  attr_accessor :session_id
  attr_accessor :segmentation_query_id

  def initialize(session_id = nil, segmentation_query_id = nil)
    @session_id = session_id
    @segmentation_query_id = segmentation_query_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}unlaunchEmailCampaignArgs
#   session_id - SOAP::SOAPString
#   campaign_id - SOAP::SOAPInt
class UnlaunchEmailCampaignArgs
  attr_accessor :session_id
  attr_accessor :campaign_id

  def initialize(session_id = nil, campaign_id = nil)
    @session_id = session_id
    @campaign_id = campaign_id
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}validateStreetAddressArgs
#   session_id - SOAP::SOAPString
#   street_address - VRAPI::StreetAddress
class ValidateStreetAddressArgs
  attr_accessor :session_id
  attr_accessor :street_address

  def initialize(session_id = nil, street_address = nil)
    @session_id = session_id
    @street_address = street_address
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}validateStreetAddressResult
#   is_valid_address - SOAP::SOAPBoolean
#   corrected_address - VRAPI::StreetAddress
class ValidateStreetAddressResult
  attr_accessor :is_valid_address
  attr_accessor :corrected_address

  def initialize(is_valid_address = nil, corrected_address = nil)
    @is_valid_address = is_valid_address
    @corrected_address = corrected_address
  end
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfCampaignContentLink
class ArrayOfCampaignContentLink < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfCompany
class ArrayOfCompany < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfDomainCount
class ArrayOfDomainCount < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfInteger
class ArrayOfInteger < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfList
class ArrayOfList < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfListMember
class ArrayOfListMember < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfNVDictionary
class ArrayOfNVDictionary < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfOrderByField
class ArrayOfOrderByField < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfRejectedRecordDetail
class ArrayOfRejectedRecordDetail < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfString
class ArrayOfString < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfUser
class ArrayOfUser < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfEmailCampaign
class ArrayOfEmailCampaign < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfEmailCampaignContent
class ArrayOfEmailCampaignContent < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfEmailCampaignDecline
class ArrayOfEmailCampaignDecline < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfEmailCampaignDomainStats
class ArrayOfEmailCampaignDomainStats < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfEmailCampaignLinkStats
class ArrayOfEmailCampaignLinkStats < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfEmailCampaignResponseHistogram
class ArrayOfEmailCampaignResponseHistogram < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfEvent
class ArrayOfEvent < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfFileSpec
class ArrayOfFileSpec < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}Histogram
class Histogram < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}NVDictionary
class NVDictionary < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfOptinQuestion
class ArrayOfOptinQuestion < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfPricingStructureTier
class ArrayOfPricingStructureTier < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfPurchaseLineItem
class ArrayOfPurchaseLineItem < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfSegmentationQuery
class ArrayOfSegmentationQuery < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfSegmentationQueryInput
class ArrayOfSegmentationQueryInput < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfSegmentationQueryInputConstraint
class ArrayOfSegmentationQueryInputConstraint < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfSegmentationQueryOutputList
class ArrayOfSegmentationQueryOutputList < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfSfMergedFieldRecords
class ArrayOfSfMergedFieldRecords < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfSurvey
class ArrayOfSurvey < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfSurveyInvitation
class ArrayOfSurveyInvitation < ::Array
end

# {http://api.verticalresponse.com/1.0/VRAPI.xsd}ArrayOfTemplateCampaignModule
class ArrayOfTemplateCampaignModule < ::Array
end


end
