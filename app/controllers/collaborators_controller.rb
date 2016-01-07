class CollaboratorsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user.nil?
      flash[:error] = "#{params[:email]} does not exist"
      redirect_to :back
      return
    end

    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @user.collaborators.build(wiki: @wiki)

    authorize @collaborator

    if @collaborator.save
      flash[:notice] = "Invited #{@user.email} to edit wiki"
    else
      flash[:error] = "Invite to #{@user.email} failed"
    end
    redirect_to :back
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    @user = User.find(@collaborator.user.id)

    authorize @collaborator

    if @collaborator.destroy
      flash[:notice] = "\"#{@user.email}\" was revoked access to edit this wiki"
    else
      flash[:error] = "Something went wrong. Please try again."
    end
    redirect_to :back
  end
end
