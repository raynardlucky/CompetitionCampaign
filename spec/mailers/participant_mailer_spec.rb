require "rails_helper"

RSpec.describe ParticipantMailer, type: :mailer do
  describe 'welcome email' do
    before do
      @participant = Participant.create(first_name: "Tester", email: "test@mail.com")
      @participant.save
      @path = "path"
    end

    let(:mail) {ParticipantMailer.welcome_email(@participant, @path)}

    it 'renders the headers' do
      expect(mail.subject).to eq("Congratulations you are registered  to stardrink competition!!")
      expect(mail.to).to eq(["test@mail.com"])
      expect(mail.from).to eq(["from@gmail.com"])
    end

    it 'renders the headers' do
        expect(mail.body.encoded).to have_content(@path)
    end
  end
end
