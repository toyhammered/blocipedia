class UserPolicy < ApplicationPolicy

  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def show

  end


  def user_match
    @user.id == @wiki.user_id
  end


end
