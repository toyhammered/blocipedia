class WikiPolicy < ApplicationPolicy

  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def create?
    user.admin? || user_match
  end

  def edit?
    user.admin? || user_match
  end

  def update?
    user.admin? || user_match
  end

  def destroy?
    user.admin? || user_match
  end


  def user_match
    @user.id == @wiki.user_id
  end


end
