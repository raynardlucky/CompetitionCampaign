class ParticipantMailer < ApplicationMailer
    def welcome_email(participant)
        @participant = participant
        mail(to: @participant.email, subject: 'Congratulations you are registered  to stardrink competition!!')
    end
end