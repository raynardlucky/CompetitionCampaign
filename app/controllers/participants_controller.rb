class ParticipantsController < ApplicationController
  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      mail = ParticipantMailer.welcome_email(@participant).deliver_now
      redirect_to @participant, alert: "Participant created successfully."
    else
      redirect_to participants_new_path, alert: "Error creating Participant."
    end
  end

  def show
    @participant = Participant.find(params[:id])
  end


  private
  def participant_params
    params.require(:participant).permit(:first_name, :last_name, :phone_number, :email, :entries, :token)
  end
end
