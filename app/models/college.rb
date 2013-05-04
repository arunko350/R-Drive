class College < ActiveRecord::Base
  attr_accessible :description, :name, :website, :university, :code

  validates_presence_of :description, :name, :website, :university, :code
  validates_uniqueness_of :name, :website, :code

end
