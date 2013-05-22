class College < ActiveRecord::Base
  attr_accessible :description, :name, :website, :university, :code

  serialize :contact, ActiveRecord::Coders::Hstore
  serialize :address, ActiveRecord::Coders::Hstore

  validates_presence_of :description, :name, :website, :university, :code
  validates_uniqueness_of :name, :website, :code
  validate :contact_address_validation
  validate :contact_uniqueness_validation

  has_many	:users
  has_and_belongs_to_many	:courses

  private
  def contact_address_validation
  	errors.add(:base, "Email can't be empty") if self.contact[:email].blank?
  	errors.add(:base, "Atleast provide one phone number") if self.contact[:office].blank? && self.contact[:mobile].blank?
  	errors.add(:base, "City can't be blank") if self.address[:city].blank?
  	errors.add(:base, "State can't be blank") if self.address[:state].blank?
  	errors.add(:base, "Country can't be blank") if self.address[:country].blank?
  	errors.add(:base, "Atleast provide one line address") if self.address[:line1].blank? && self.address[:line2].blank?
  	# @TODO: Pincode validation so that it takes only digits.
  	errors.add(:base, "Pincode must have exactly 6 digits") if self.address[:pincode].delete(" ").length != 6
  end

  def contact_uniqueness_validation
  	errors.add(:base, "Contact Email appears to be of someother college's") if College.where("contact -> 'email' = :contact_email", :contact_email => self.contact[:email].strip).exists?
  	errors.add(:base, "Contact Phone appears to be of someother college's") if College.where("contact -> 'office' = :contact_office", :contact_office => self.contact[:office].strip).exists? or College.where("contact -> 'mobile' = :contact_mobile", :contact_mobile => self.contact[:mobile].strip).exists?
  end

end
