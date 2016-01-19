class CollaboratorsController < ApplicationController
  def create
    
    @user = User.find_by(email: params[:email])
    @wiki = Wiki.find(params[:wiki_id])
    if @user.nil?
      flash[:error] = "#{params[:email]} does not exist"
      redirect_to @wiki
      return
    end

    @collaborator = @user.collaborators.build(wiki: @wiki)

    authorize @collaborator

    if @collaborator.save
      flash[:notice] = "Added #{@user.email} to edit wiki"
    else
      flash[:error] = "#{@user.email} is already an editor"
    end
    redirect_to @wiki
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    @user = User.find(@collaborator.user_id)
    @wiki = Wiki.find(@collaborator.wiki_id)

    authorize @collaborator

    if @collaborator.destroy
      flash[:notice] = "\"#{@user.email}\" was revoked access to edit this wiki"
    else
      flash[:error] = "Something went wrong. Please try again."
    end
    redirect_to @wiki
  end
end
