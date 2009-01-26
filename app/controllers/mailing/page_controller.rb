
class Mailing::PageController < ParagraphController


  editor_header 'Mailing Paragraphs'
  editor_for :mail_template_list, :name => 'Online list of Mail Templates',  :features => ['mail_template_list']
  
  
  def mail_template_list
    @options = MailTemplateListOptions.new(params[:mail_template_list] || @paragraph.data)
    return if handle_module_paragraph_update(@options)  
  end
  
  class MailTemplateListOptions < HashModel
    default_options :category => nil, :per_page => 10
    
    integer_options :per_page
  end
    
end
