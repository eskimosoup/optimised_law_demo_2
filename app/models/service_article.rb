class ServiceArticle < ActiveRecord::Base
  belongs_to :article
  belongs_to :service
end
