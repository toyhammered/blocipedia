class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @private_wikis = WikiPolicy::Scope.new(@user, Wiki).my_private_wiki
    @public_wikis = WikiPolicy::Scope.new(@user, Wiki).my_public_wiki
    @editor_wikis = WikiPolicy::Scope.new(@user, Wiki).my_editor_wiki

  end
end
