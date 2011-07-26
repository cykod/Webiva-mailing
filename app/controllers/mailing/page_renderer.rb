

class Mailing::PageRenderer < ParagraphRenderer


  paragraph :mail_template_list
  
feature :mail_template_list, :default_feature => <<-FEATURE
  <cms:templates>
    <cms:template>
    <h1><cms:name/></h1>
    <cms:html/>
    <cms:not_last><hr/></cms:not_last>
    </cms:template>
    <div align='center'>
      <cms:pages/>
    </div>
  </cms:templates>
  FEATURE
  
  def mail_template_list_feature(data)
    webiva_feature('mail_template_list') do |c|
      c.define_expansion_tag('templates') { |tag| data[:mail_templates].length > 0 }
      c.define_tag('template') { |tag| c.each_local_value(data[:mail_templates],tag,'tpl') }
      c.define_value_tag('template:name') { |tag| tag.locals.tpl.name }
      c.define_value_tag('template:html') { |tag| tag.locals.tpl.body_html }
      c.define_value_tag('template:text') { |tag| tag.locals.tpl.body_text }
      c.define_position_tags
      c.define_pagelist_tag('templates:pages') { |t| data[:page] }
    end
  end
    
  
  def mail_template_list
    @options = Mailing::PageController::MailTemplateListOptions.new(paragraph.data)
    
    
    target_string = "List"
    @page = (params[:page] || 1).to_i
    
    display_string = "#{paragraph.id}_#{@page}"

    feature_output = DataCache.get_content("Mailing",target_string,display_string) unless editor?
  
    if !feature_output
      
        conditions = ['template_type = "campaign" AND published_at IS NOT NULL' ]
        if @options.category.present? 
          conditions[0] += " AND category = ?"
          conditions << @options.category
        end

        @pages,@tpls = MailTemplate.paginate(@page,:conditions => conditions, :order => 'published_at DESC', :per_page => @options.per_page )
        
        data = { :mail_templates => @tpls, :pages => @pages, :url => page_path }
        
        feature_output = mail_template_list_feature(data)
        
        DataCache.put_content("Mailing",target_string,display_string,feature_output) unless editor?
    end
    render_paragraph :text => feature_output
  end

end
