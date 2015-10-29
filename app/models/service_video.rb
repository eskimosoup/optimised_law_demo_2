class ServiceVideo < ActiveRecord::Base
  belongs_to :video
  belongs_to :service
end
