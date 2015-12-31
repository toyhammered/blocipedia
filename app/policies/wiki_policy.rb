class WikiPolicy < ApplicationPolicy

  class Scope < Scope

    def my_private_wiki
      scope.where(user_id: @user.id, private: true)
    end

    def my_public_wiki
      scope.where(user_id: @user.id, private: false)
    end
  end

  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def create?
    if wiki.private?
      user.admin? || user.premium?
    else
      true
    end
  end

  def show?
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

private

  def user_match
    user.id == wiki.user_id
  end


end
