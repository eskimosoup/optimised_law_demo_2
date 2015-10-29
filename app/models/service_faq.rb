class ServiceFaq < ActiveRecord::Base
  belongs_to :frequently_asked_question
  belongs_to :service
end
