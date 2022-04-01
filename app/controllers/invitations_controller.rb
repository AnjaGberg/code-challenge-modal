class InvitationsController < ApplicationController

  def new
    @invitation = Invitation.new
    respond_to do |format|
      format.html
      format.js
  end
end
