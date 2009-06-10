require "configuration"

# ActsAsConfigurable
#module ActiveRecord #:nodoc:
module XYZ
  module Acts #:nodoc:
    module Configurable #:nodoc:
      def self.included(base)
        base.extend(ClassMethods)
 
      end
      
      module ClassMethods
      
      
        def acts_as_configurable
        
          include XYZ::Acts::Configurable::InstanceMethods
          extend XYZ::Acts::Configurable::SingletonMethods
          has_one :configuration , :as => :creator
          before_create :initialize_config
        end
      end
      
      module SingletonMethods
      end
      
      module InstanceMethods
        def config_settings(key,value = nil)
          self.configuration ||=  Configuration.new
          self.configuration.data ||= Hash.new
          if value == nil
            return self.configuration.data["#{key}"]
          else
            self.configuration.data["#{key}"] = "#{value}"
            self.configuration.creator = self
          end
        end
        def initialize_config
          self.configuration ||=  Configuration.new
        end  
      end #instance methods
    end #Configurable
  end #Acts
end # Active Record
      

ActiveRecord::Base.send(:include, XYZ::Acts::Configurable)
