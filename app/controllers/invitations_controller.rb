class InvitationsController < ApplicationController

  def new
    @cycle = Cycle.find(params[:id])
    @invitation = Invitation.new
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end
end
