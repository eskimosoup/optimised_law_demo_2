class ServiceDownload < ActiveRecord::Base
  belongs_to :download
  belongs_to :service
end
