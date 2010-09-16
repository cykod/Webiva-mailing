#!/usr/bin/ruby

# Version 1.0
# Last Updated 6/22/2009

require 'json'
 
class SendGrid::SmtpApiHeader
  
  def initialize()
    @data = {}
  end  
 
  def addTo(to)
    @data['to'] ||= []
    @data['to'] += to.kind_of?(Array) ? to : [to]
  end 
 
  def addSubVal(var, val)
    if not @data['sub']
      @data['sub'] = {}
    end
    if val.instance_of?(Array)
      @data['sub'][var] = val  
    else
      @data['sub'][var] = [val]    
    end
  end
 
  def setUniqueArgs(val)
    if val.instance_of?(Hash)
      @data['unique_args'] = val
    end
  end
 
  def setCategory(cat)
 
    @data['category'] = cat
  end
 
  def addFilterSetting(fltr, setting, val)
    if not @data['filters']
      @data['filters'] = {}
    end
    if not @data['filters'][fltr]
      @data['filters'][fltr] = {}
    end
    if not @data['filters'][fltr]['settings']
      @data['filters'][fltr]['settings'] = {}
    end
    @data['filters'][fltr]['settings'][setting] = val
  end
 
  def asJSON()
    json = @data.to_json
    # adds a space after , and :
    return json.gsub(/(["\]}])([,:])(["\[{])/, '\\1\\2 \\3')
  end
 
  def as_string()
    json  = asJSON()
    # adds a newline every 1 to 72 characters
    str = 'X-SMTPAPI: %s' % json.gsub(/(.{1,500})( +|$\n?)|(.{1,500})/,"\\1\\3\n")
    return str    
  end
end
