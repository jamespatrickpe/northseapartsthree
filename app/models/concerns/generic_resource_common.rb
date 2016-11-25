module GenericResourceCommon
  extend ActiveSupport::Concern

  included do
    before_create {
      self.id = UUIDTools::UUID.timestamp_create().to_s.downcase if id.blank?
    }

    searchable do
      string :id
      text :id

      time :created_at
      time :updated_at
    end
    
  end

  module ClassMethods

    def searchable_string(attribute)
      searchable do
        string attribute
        text attribute
      end
    end

  end

end