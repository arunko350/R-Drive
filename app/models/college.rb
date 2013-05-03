class College < ActiveRecord::Base
  attr_accessible :active, :address, :contact, :description, :name
end
