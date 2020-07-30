class Invite < ApplicationRecord
    belongs_to :sender, :class_name => 'Participant'
    belongs_to :recipient, :class_name => 'Participant'
end
