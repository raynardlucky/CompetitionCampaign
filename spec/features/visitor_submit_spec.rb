require 'rails_helper'

describe 'new participant' do
    it 'ensures that the form route works with the /new action' do
        visit participants_new_path
        expect(page.status_code).to eq(200)
    end

    it 'renders HTML in the /new template' do
        visit participants_new_path
        expect(page).to have_content('First name')
    end

    it 'creates new participant and send email after form is submitted' do
        visit participants_new_path
        fill_in "participant_first_name", with: "John"
        fill_in "participant_last_name", with: "Doe"
        fill_in "participant_phone_number", with: "123456"
        fill_in "participant_email", with: "test@gmail.com"
        click_button "Submit"
        mail = ActionMailer::Base.deliveries

        expect(Participant.count).to eq(1)
        expect(mail.size).to eq(1)
        expect(mail.last.subject).to eq("Congratulations you are registered  to stardrink competition!!")
        expect(mail.last.to).to eq(["test@gmail.com"])
    end

    it 'doesnt create new participant if email blank' do
        visit participants_new_path
        fill_in "participant_first_name", with: "John"
        fill_in "participant_last_name", with: "Doe"
        fill_in "participant_phone_number", with: "123456"
        click_button "Submit"
        expect(Participant.count).to eq(0)
    end
end

describe 'new invited participant' do
    before do
        visit participants_new_path
        fill_in "participant_first_name", with: "John"
        fill_in "participant_last_name", with: "Doe"
        fill_in "participant_phone_number", with: "123456"
        fill_in "participant_email", with: "test@gmail.com"
        click_button "Submit"
    end

    it 'create new invited participants' do
        visit participants_new_path(invite_token: Participant.first.token)
        fill_in "participant_first_name", with: "Bro"
        fill_in "participant_last_name", with: "Doe"
        fill_in "participant_phone_number", with: "8966325"
        fill_in "participant_email", with: "try@mail.com"
        click_button "Submit"

        expect(Participant.count).to eq(2)
        expect(Participant.first.entries).to eq(2)
     end
end