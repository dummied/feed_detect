module FeedDetectHelpers
  def self.included(base)
    base.class_eval do
      include FeedDetectHelpers::Helpers
    end
  end
  
  module Helpers
   
    def feed_tag
       if defined?(@feed_url)
         if @feed_url.include?("format=")
           type = @feed_url.match(/format=(\D+)&|$/)[0]
         else 
           type = @feed_url.split(".").last
         end
         auto_discovery_link_tag(type.to_sym, @feed_url)
       end
    end  
  
  end
  
end