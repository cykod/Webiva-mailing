module ActionDispatch::Routing
  class Mapper
    def webiva_mailing_routes
      match "/website/campaigns(/:action(/*path))", :controller => 'campaigns'
    end
  end
end
