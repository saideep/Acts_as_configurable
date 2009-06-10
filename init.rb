# Include hook code here
require 'configuration' 
require File.dirname(__FILE__) + '/lib/acts_as_configurable'
#require File.dirname(__FILE__) + '/lib/configuration'
ActiveRecord::Base.send(:include, XYZ::Acts::Configurable)