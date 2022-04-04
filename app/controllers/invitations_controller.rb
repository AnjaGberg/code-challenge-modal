class InvitationsController < ApplicationController
  before_action :fetch_email, :fetch_name, only: [:create]

  def new
    @cycle = Cycle.find(params[:cycle_id])
    @invitation = Invitation.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @invitation = Invitation.new(email: @email, name: @name, message: invitation_params[:message])
    @invitation.cycle_id = (params[:cycle_id])
    if @invitation.save
      redirect_to root_path
    else
      respond_to do |format|
        format.html
        format.js { render :new, locals: {cycle_id: params[:cycle_id]} }
      end
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email, :message)
  end

  def fetch_name
    @name = invitation_params[:email].include?('<') ? invitation_params[:email].split('<')[0].strip : invitation_params[:email].split('@')[0].gsub('.', ' ').titleize
  end

  def fetch_email
    @email = invitation_params[:email].include?('<') ? invitation_params[:email].split('<')[1].chomp('>') : invitation_params[:email]
  end
end
