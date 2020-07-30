class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def current_user
  #   return unless session[:participant_id]
  #   @current_user ||= Particpant.find(session[:participant_id])
  # end
end
