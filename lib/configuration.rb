class Configuration < ActiveRecord::Base
  serialize :data, Hash
  belongs_to :creator, :polymorphic => true
  
end  
