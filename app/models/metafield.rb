class Metafield < ActiveRecord::Base
  attr_accessible :namespace, :key, :value, :value_type, :description, :id
end
