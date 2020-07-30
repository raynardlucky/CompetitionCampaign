class ParticipantsController < ApplicationController
  def new
    @token = params[:invite_token]
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      token = Digest::SHA1.hexdigest([@participant.id, Time.now, rand].join)
      @participant.token = token
      @participant.save
      ParticipantMailer.welcome_email(@participant, participants_new_path(:invite_token => token)).deliver_now
      redirect_to @participant, alert: "Participant created successfully."

      @token_params = params[:invite_token]
      if @token_params != nil
        inviter = Participant.find_by(token: @token_params)
        if inviter != nil
          inviter.increment(:entries).save
        end
      end
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