class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def generate_uuid
    self.id = UUIDTools::UUID.random_create
  end

  before_create :generate_uuid
end