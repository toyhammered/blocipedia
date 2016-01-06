class WikiPolicy < ApplicationPolicy

  class Scope < Scope

    def my_private_wiki
      scope.where(user_id: @user.id, private: true)
    end

    def my_public_wiki
      scope.where(user_id: @user.id, private: false)
    end

    def my_editor_wiki
      user.collaborators.where(user_id: @user.id).collect {|wiki| Wiki.find(wiki.wiki_id)}
    end
  end


  def create?
    if record.private?
      user.admin? || user.premium?
    else
      true
    end
  end

  def show?
    user.admin? || user_match || user_collaborator
  end

  def edit?
    user.admin? || user_match || user_collaborator
  end

  def update?
    user.admin? || user_match || user_collaborator
  end

  def destroy?
    user.admin? || user_match
  end

private

  def user_match
    user.id == record.user_id
  end

  def user_collaborator
    Collaborator.exists?(user_id: user.id, wiki_id: record.id)
  end


end
