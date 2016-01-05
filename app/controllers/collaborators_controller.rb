class CollaboratorsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    # catch an error if @user = nil

    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @user.collaborators.build(wiki: @wiki)
    # add to protect against adding myself to own user, and check if not already a collaborator
    authorize @collaborator

    if @collaborator.save
      flash[:notice] = "Invited #{@user.email} to edit wiki"
    else
      flash[:error] = "Invite to #{@user.email} failed"
    end
    redirect_to :back
  end

  def destroy
  end
end
