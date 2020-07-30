require 'rails_helper'
include ActiveJob::TestHelper

describe 'new participant' do
    it 'ensures that the form route works with the /new action' do
        visit participants_new_path
        expect(page.status_code).to eq(200)
    end

    it 'renders HTML in the /new template' do
        visit participants_new_path
        expect(page).to have_content('First name')
    end

    it 'creates new participant after form is submitted' do
        visit participants_new_path
        fill_in "participant_first_name", with: "John"
        fill_in "participant_last_name", with: "Doe"
        fill_in "participant_phone_number", with: "123456"
        fill_in "participant_email", with: "rayluck25@gmail.com"
        click_button "Submit"
        expect(Participant.count).to eq(1)
    end

    it 'doesnt create new participant if email blank' do
        visit participants_new_path
        fill_in "participant_first_name", with: "John"
        fill_in "participant_last_name", with: "Doe"
        fill_in "participant_phone_number", with: "123456"
        click_button "Submit"
        expect(Participant.count).to eq(0)
    end

    # describe "email" do
    #     mail = ActionMailer::Base.deliveries.last
    #     it "renders the headers" do
    #         expect(mail.subject).to eq("Congratulations")
    #         expect(mail.to).to eq(["rayluck25@gmail.com"])
    #     end

    #     it "renders the body" do
    #         expect(mail.body.encoded).to match("Congratulations")
    #     end
    # end


end