class WikisController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: [:index, :show, :new]

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki was created"
      redirect_to [@wiki]
    else
      flash[:error] = "Error creating Wiki. Please try again"
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)

    authorize @wiki

    if @wiki.save
      flash[:notice] = "Wiki was updated"
      redirect_to @wiki
    else
      render[:error] = "There was an error saving your wiki. Please try again"
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    authorize @wiki

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to @wiki
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end

end
