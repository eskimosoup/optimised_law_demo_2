class ServiceRelatedService < ActiveRecord::Base
  belongs_to :service
  belongs_to :related_service, class_name: "Service"

  delegate :name, to: :related_service, prefix: true
end
