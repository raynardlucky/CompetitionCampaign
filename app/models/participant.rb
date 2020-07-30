class Participant < ApplicationRecord
    # validation
    validates_presence_of :email
    has_many :invitations, :class_name => "Invite", :foreign_key => 'recipient_id'
    has_many :sent_invites, :class_name => "Invite", :foreign_key => 'sender_id'
end
