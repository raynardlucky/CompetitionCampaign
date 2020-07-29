class Participant < ApplicationRecord
    # validation
    validates_presence_of :email
end
