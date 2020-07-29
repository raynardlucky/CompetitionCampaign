class ParticipantsController < ApplicationController
  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(params[:participant])
    if @participant.save
      redirect_to @participant, alert: "Participant created successfully."
    else
      redirect_to new_user_path, alert: "Error creating Participant."
    end
  end
end
