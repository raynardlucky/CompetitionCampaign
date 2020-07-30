class Participant < ApplicationRecord
    # validation
    validates_presence_of :email

    after_initialize :init

    def init
        self.entries ||= 1
    end
end
