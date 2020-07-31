require 'rails_helper'

RSpec.describe ParticipantsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end 
  end

  describe "GET #winner" do
    before do
      # 15.times{Participant.create(entries: rand(1..10))}
      Participant.create(first_name: "John", last_name: "Doe", email: "test1@mail.com", phone_number: "08965411", entries: 8).save
      Participant.create(first_name: "Capt", last_name: "America", email: "test2@mail.com", phone_number: "08965412", entries: 10).save
      Participant.create(first_name: "Thor", last_name: "Asgard", email: "test3@mail.com", phone_number: "08965413", entries: 1).save
      Participant.create(first_name: "Tony", last_name: "Star", email: "test4@mail.com", phone_number: "08965414", entries: 5).save
      Participant.create(first_name: "Wanda", last_name: "Doe", email: "test5@mail.com", phone_number: "08965415", entries: 3).save
      Participant.create(first_name: "Steve", last_name: "Roger", email: "test6@mail.com", phone_number: "08965416", entries: 4).save
      Participant.create(first_name: "Jess", last_name: "No", email: "test7@mail.com", phone_number: "08965417", entries: 2).save
      Participant.create(first_name: "Kia", last_name: "Ono", email: "test8@mail.com", phone_number: "08965418", entries: 8).save
      Participant.create(first_name: "Bruce", last_name: "Wyen", email: "test9@mail.com", phone_number: "08965419", entries: 3).save
      Participant.create(first_name: "Dumble", last_name: "Dor", email: "test10@mail.com", phone_number: "08965420", entries: 4).save
      Participant.create(first_name: "Heri", last_name: "Poter", email: "test11@mail.com", phone_number: "08965421", entries: 2).save
    end

    it "returns http success" do
      get :winner
      expect(response).to have_http_status(200)
    end 
end

end