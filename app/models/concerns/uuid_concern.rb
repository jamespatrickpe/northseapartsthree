module UUIDConcern extend ActiveSupport::Concern

  included do
    before_create {
      self.id = UUIDTools::UUID.timestamp_create().to_s.downcase if id.blank?
    }
  end

end