class UsersController < ApplicationController
  def show
    WillPaginate.per_page = 4
    @user = User.find(params[:id])

    @private_wikis = (WikiPolicy::Scope.new(@user, Wiki).my_private_wiki).paginate(page: params[:page]).order('updated_at DESC')

    @public_wikis = (WikiPolicy::Scope.new(@user, Wiki).my_public_wiki).paginate(page: params[:page]).order('updated_at DESC')

    @editor_wikis = (WikiPolicy::Scope.new(@user, Wiki).my_editor_wiki).paginate(page: params[:page])

  end
end
