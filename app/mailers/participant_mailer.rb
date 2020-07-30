class ParticipantMailer < ApplicationMailer
    def welcome_email(participant, path)
        @participant = participant
        @link = "localhost:3000" + path
        mail(to: @participant.email, subject: 'Congratulations you are registered  to stardrink competition!!')
    end
end